import 'package:get_it/get_it.dart';
import 'package:pct_mark/core/app_data/tenant_data.dart';
import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/features/auth/data/datasources/auth_remote_remote_data_source.dart';
import 'package:pct_mark/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pct_mark/features/auth/data/storage_manager.dart'; // Ensure correct path
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/broker_login.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/tenant_login.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';
import 'package:pct_mark/features/tenant_features/help_screen/data/data_sources/new_complaint_remote_data_source.dart';
import 'package:pct_mark/features/tenant_features/help_screen/data/repositories/new_complaint_repo_impl.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/repository/UseCases/edit_complaint.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/repository/edit_complaint_repository.dart';
import 'package:pct_mark/features/tenant_features/help_screen/presentation/bloc/edit_complaint_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final sharedPreferences = await SharedPreferences.getInstance();

  final storageManager = StorageManager();
  final userData = await storageManager.getUserData();
  final httpService = HttpService(baseUrl: ApiEndPoints.baseUrl);

  // Set the token if it exists
  if (userData != null && userData.token.isNotEmpty) {
    httpService.setToken(userData.token);
  }

  serviceLocator.registerLazySingleton(() => httpService);
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => storageManager);

  // Register TenantDataService with StorageManager
  serviceLocator.registerLazySingleton(
      () => TenantDataService(serviceLocator<StorageManager>()));

  // Load saved tenant data
  final tenantDataService = serviceLocator<TenantDataService>();
  final tenantData = await tenantDataService.getTenantData();
  if (tenantData != null) {
    await tenantDataService.saveTenantData(tenantData);
  }
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(() => BrokerLogin(serviceLocator()));
  serviceLocator.registerFactory(() => TenantLogin(serviceLocator()));

  serviceLocator.registerLazySingleton(
    () =>
        LoginBloc(brokerLogin: serviceLocator(), tenantLogin: serviceLocator()),
  );

  //for Newtenantcomplaints
  serviceLocator.registerFactory<NewComplaintRemoteDataSource>(
    () => NewComplaintRemoteDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<NewComplaintRepository>(
    () => NewComplaintRepoImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(() => NewComplaint(serviceLocator()));

  serviceLocator
      .registerFactory(() => EditComplaintBloc(newComplaint: serviceLocator()));
}
