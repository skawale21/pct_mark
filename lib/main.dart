import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/core/theme.dart';
import 'package:pct_mark/features/auth/data/datasources/auth_remote_remote_data_source.dart';
import 'package:pct_mark/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/broker_login.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/tenant_login.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';
import 'package:pct_mark/features/auth/presentation/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final httpService = HttpService(baseUrl: ApiEndPoints.baseUrl);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => LoginBloc(
          brokerLogin: BrokerLogin(
              AuthRepositoryImpl(AuthRemoteDataSourceImpl(httpService))),
          tenantLogin: TenantLogin(
              AuthRepositoryImpl(AuthRemoteDataSourceImpl(httpService)))),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Care Taker',
      theme: AppTheme.lightThemeMode,
      home: const LoginScreen(),
    );
  }
}
