import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pct_mark/core/common/resources/app_routes_constant.dart';
import 'package:pct_mark/core/common/widgets/route_error_page.dart';
import 'package:pct_mark/features/auth/presentation/login_screen.dart';

class AppRoutesConfig {
  final router = GoRouter(
      routes: [
        GoRoute(
          name: AppRoutes.loginRoute,
          path: '/login',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: LoginScreen(),
            );
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },
      initialLocation: '/login');
}
