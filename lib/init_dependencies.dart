import 'package:get_it/get_it.dart';
import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/features/auth/data/datasources/auth_remote_remote_data_source.dart';
import 'package:pct_mark/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/broker_login.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/tenant_login.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final httpService = HttpService(baseUrl: ApiEndPoints.baseUrl);

  serviceLocator.registerLazySingleton(() => httpService);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
        serviceLocator()), //register AuthRemoteDataSourceImpl
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => BrokerLogin(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => TenantLogin(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () =>
        LoginBloc(brokerLogin: serviceLocator(), tenantLogin: serviceLocator()),
  );
}
