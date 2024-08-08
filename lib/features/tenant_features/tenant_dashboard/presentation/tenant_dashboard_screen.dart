import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pct_mark/core/common/resources/app_routes_constant.dart';
import 'package:pct_mark/core/common/resources/string_manager.dart';

class TenantDashboardScreen extends StatefulWidget {
  const TenantDashboardScreen({super.key});

  @override
  State<TenantDashboardScreen> createState() => _TenantDashboardScreenState();
}

class _TenantDashboardScreenState extends State<TenantDashboardScreen> {
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
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: const Drawer(),
        body: const SingleChildScrollView(
          child: Center(
            child: Text('Tenant dashboard'),
          ),
        ),
      ),
    );
  }
}
