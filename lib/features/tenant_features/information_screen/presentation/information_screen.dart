import 'dart:core';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pct_mark/core/app_data/data_model/tenant_data_model.dart';
import 'package:pct_mark/core/app_data/tenant_data.dart';
import 'package:pct_mark/core/common/models/details_row_model.dart';
import 'package:pct_mark/core/common/resources/app_routes_constant.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';
import 'package:pct_mark/core/common/resources/string_manager.dart';
import 'package:pct_mark/core/common/widgets/custom_medim_text.dart';
import 'package:pct_mark/core/common/widgets/details_list_with_heading.dart';
import 'package:pct_mark/features/auth/data/storage_manager.dart';
import 'package:pct_mark/init_dependencies.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  late StorageManager storageManager;
  late Future<TenantData?> tenantDataFuture;

  @override
  void initState() {
    super.initState();
    storageManager = serviceLocator<StorageManager>();
    tenantDataFuture = _fetchTenantData();
  }

  Future<TenantData?> _fetchTenantData() async {
    final tenantDataService = serviceLocator<TenantDataService>();
    return await tenantDataService.getTenantData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(PctStrings.tenantDashboardTitle),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(AppRoutes.tenantNotifications);
              },
              icon: SvgPicture.asset(PctImages.tnotification),
            )
          ],
        ),
        drawer: const Drawer(),
        body: FutureBuilder<TenantData?>(
          future: tenantDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No tenant data available'));
            }

            final tenant = snapshot.data!;
            List<DetailsRowModel> detailsData = [
              DetailsRowModel(
                  title: 'Name', value: tenant.data?.name ?? 'Apartment Name'),
              DetailsRowModel(title: 'Wing', value: 'wing needed'),
              DetailsRowModel(
                  title: 'Flat Number',
                  value: tenant.data?.flatNumber.toString() ?? 'Not Available'),
              DetailsRowModel(
                  title: 'Type Of Flat',
                  value: tenant.data?.flatType ?? 'Not Available'),
              DetailsRowModel(
                title: 'Address',
                value:
                    '${tenant.data!.bookedTenent?.address1 ?? 'Not Available'},\n${tenant.data!.bookedTenent?.address2 ?? ''}',
              )
            ];
            List<DetailsRowModel> otherDetails = [
              DetailsRowModel(
                  title: 'Monthly Rent',
                  value: tenant.data!.bookedTenent?.monthlyRent.toString() ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Joining date',
                  value: tenant.data!.bookedTenent?.joiningDate.toString() ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Leaving Date',
                  value: tenant.data!.bookedTenent?.leavingDate.toString() ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Rent Payment Date',
                  value: tenant.data!.bookedTenent?.leavingDate.toString() ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Security Deposit',
                  value:
                      tenant.data!.bookedTenent?.securityDeposite.toString() ??
                          'Not Available')
            ];
            List<DetailsRowModel> documentDetails = [
              DetailsRowModel(
                  title: 'Aadhar Number',
                  value: tenant.data!.bookedTenent?.aadhaarNumber.toString() ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Identity Proof',
                  value: tenant.data!.bookedTenent?.identityProof ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Address Proof',
                  value: tenant.data!.bookedTenent?.addressProof ??
                      'Not Available'),
              DetailsRowModel(
                  title: 'Rent Agreement',
                  value: tenant.data!.bookedTenent?.rentAgreement ??
                      'Not Available'),
            ];

            return SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              child: Container(
                child: Column(
                  children: [
                    CustomMediumCentreText(
                      showText:
                          tenant.data?.bookedTenent?.name ?? 'tenant name',
                    ),
                    DetailsListWithHeadingWidget(
                      detailsData: detailsData,
                      heading: 'Flat Details',
                    ),
                    DetailsListWithHeadingWidget(
                        detailsData: otherDetails, heading: 'Other Details'),
                    DetailsListWithHeadingWidget(
                        detailsData: documentDetails,
                        heading: 'Document Details'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
