import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/core/app_data/tenant_data.dart';
import 'package:pct_mark/core/common/resources/app_routes_config.dart';
import 'package:pct_mark/core/providers/tenant_bottom_navigation_provider.dart';
import 'package:pct_mark/core/theme.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';
import 'package:pct_mark/features/tenant_features/help_screen/presentation/bloc/edit_complaint_bloc.dart';
import 'package:pct_mark/init_dependencies.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<LoginBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<EditComplaintBloc>(),
        ),
        ChangeNotifierProvider(create: (_) => TenantBottomNavigationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getInitialRoute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final initialRoute = snapshot.data ?? '/login';
        return MaterialApp.router(
          title: 'Property Care Taker',
          theme: AppTheme.lightThemeMode,
          routerConfig: AppRoutesConfig(initialRoute).router,
        );
      },
    );
  }

  Future<String> _getInitialRoute() async {
    final tenantDataService = serviceLocator<TenantDataService>();
    final tenant = await tenantDataService.getTenantData();

    if (tenant != null) {
      return '/api/tenant/tenantHomeScreen'; // Or any route based on tenant data
    }

    final sharedPreferences = await SharedPreferences.getInstance();
    final userType = sharedPreferences.getString('userType');
    final token = sharedPreferences.getString('token');
    final rememberMe = sharedPreferences.getBool('rememberMe') ?? false;

    if ((userType == null || token == null) && !rememberMe) {
      return '/login';
    }

    if (userType == 'UserType.broker' && rememberMe) {
      return '/api/broker/brokerdashboard';
    }

    if (userType == 'UserType.tenant' && rememberMe) {
      return '/api/tenant/tenantHomeScreen';
    }

    return '/login';
  }
}
