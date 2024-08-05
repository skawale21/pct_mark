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
import 'package:pct_mark/init_dependencies.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final tenantdata = serviceLocator<TenantDataService>();
    TenantData? tenant = tenantdata.getTenantData();

    List<DetailsRowModel> detailsData = [
      DetailsRowModel(
          title: 'Name', value: tenant!.data?.name ?? 'Appartment Name'),
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
          value: tenant.data!.bookedTenent?.securityDeposite.toString() ??
              'Not Available')
    ];
    List<DetailsRowModel> documentDetails = [
      DetailsRowModel(
          title: 'Aadhar Number',
          value: tenant.data!.bookedTenent?.aadhaarNumber.toString() ??
              'Not Available'),
      DetailsRowModel(
          title: 'Identity Proof',
          value: tenant.data!.bookedTenent?.identityProof ?? 'Not Available'),
      DetailsRowModel(
          title: 'Address Proof',
          value: tenant.data!.bookedTenent?.addressProof ?? 'Not Available'),
      DetailsRowModel(
          title: 'Rent Agreement',
          value: tenant.data!.bookedTenent?.rentAgreement ?? 'Not Available'),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(PctStrings.tenantDashboardTitle),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(AppRoutes.brokerDashboard);
              },
              icon: SvgPicture.asset(PctImages.tnotification),
            )
          ],
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          child: Container(
            child: Column(
              children: [
                CustomMediumCentreText(
                  showText: tenant.data?.bookedTenent?.name ?? 'tenant name',
                ),
                DetailsListWithHeadingWidget(
                  detailsData: detailsData,
                  heading: 'Flat Details',
                ),
                DetailsListWithHeadingWidget(
                    detailsData: otherDetails, heading: 'Other Details'),
                DetailsListWithHeadingWidget(
                    detailsData: documentDetails, heading: 'Document Details'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
