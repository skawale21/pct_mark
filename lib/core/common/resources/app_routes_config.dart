import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pct_mark/core/common/resources/app_routes_constant.dart';
import 'package:pct_mark/core/error/route_error_page.dart';
import 'package:pct_mark/features/auth/presentation/login_screen.dart';
import 'package:pct_mark/features/broker_dashboard/presentation/broker_dashboard_screen.dart';
import 'package:pct_mark/features/tenant_dashboard/presentation/tenant_dashboard_screen.dart';

class AppRoutesConfig {
  final String initialRoute;

  AppRoutesConfig(this.initialRoute);

  late final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        name: AppRoutes.loginRoute,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: AppRoutes.brokerDashboard,
        path: '/api/broker/brokerdashboard',
        pageBuilder: (context, state) {
          return const MaterialPage(child: BrokerDashboardScreen());
        },
      ),
      GoRoute(
        name: AppRoutes.tenantDashboard,
        path: '/api/tenant/tenantdashboard',
        pageBuilder: (context, state) {
          return const MaterialPage(child: TenantDashboardScreen());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: RouteErrorPage());
    },
  );
}
