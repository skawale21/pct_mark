import 'package:get_it/get_it.dart';
import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/features/auth/data/datasources/auth_remote_remote_data_source.dart';
import 'package:pct_mark/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/broker_login.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/tenant_login.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final httpService = HttpService(baseUrl: ApiEndPoints.baseUrl);

  serviceLocator.registerLazySingleton(() => httpService);
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
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
}


/*


To achieve persistent login functionality and redirect users to the appropriate dashboard based on their role (broker or tenant), you can use a combination of `shared_preferences` for storing simple data like tokens and user types, and `flutter_secure_storage` for more sensitive data. Here's how you can modify your existing setup to include data persistence:

1. **Modify `LoginBloc` to handle authentication and storing user data:**
   ```dart
   class LoginBloc extends Bloc<LoginEvent, LoginState> {
     final BrokerLogin brokerLogin;
     final TenantLogin tenantLogin;

     LoginBloc({required this.brokerLogin, required this.tenantLogin})
         : super(LoginInitial());

     @override
     Stream<LoginState> mapEventToState(LoginEvent event) async* {
       if (event is LoginButtonPressed) {
         // Perform login based on event (broker or tenant) 
         try {
           if (event.userType == UserType.broker) {
             final brokerToken = await brokerLogin.login(event.username, event.password);
             await saveUserData(userType: UserType.broker, token: brokerToken);
           } else if (event.userType == UserType.tenant) {
             final tenantToken = await tenantLogin.login(event.username, event.password);
             await saveUserData(userType: UserType.tenant, token: tenantToken);
           }
           yield LoginSuccess();
         } catch (error) {
           yield LoginFailure(error.toString());
         }
       }
     }

     Future<void> saveUserData({required UserType userType, required String token}) async {
       final sharedPreferences = await SharedPreferences.getInstance();
       await sharedPreferences.setString('userType', userType.toString());
       await sharedPreferences.setString('token', token);
     }
   }
   ```

2. **Update `initDependencies()` to initialize storage dependencies:**
   ```dart
   Future<void> initDependencies() async {
     _initAuth();
     final httpService = HttpService(baseUrl: ApiEndPoints.baseUrl);

     serviceLocator.registerLazySingleton(() => httpService);

     // Initialize storage dependencies
     final sharedPreferences = await SharedPreferences.getInstance();
     serviceLocator.registerLazySingleton(() => sharedPreferences);
   }
   ```

3. **In your `MyApp` widget, check for stored user data and redirect accordingly:**
   ```dart
   class MyApp extends StatelessWidget {
     const MyApp({Key? key});

     @override
     Widget build(BuildContext context) {
       final sharedPreferences = serviceLocator<SharedPreferences>();
       final userType = sharedPreferences.getString('userType');

       Widget initialRoute;
       if (userType == UserType.broker.toString()) {
         initialRoute = BrokerDashboardScreen();
       } else if (userType == UserType.tenant.toString()) {
         initialRoute = TenantDashboardScreen();
       } else {
         initialRoute = const LoginScreen();
       }

       return MaterialApp(
         title: 'Property Care Taker',
         theme: AppTheme.lightThemeMode,
         home: initialRoute,
         routes: {
           '/broker_dashboard': (context) => BrokerDashboardScreen(),
           '/tenant_dashboard': (context) => TenantDashboardScreen(),
         },
       );
     }
   }
   ```

4. **Handle logout:**
   When the user logs out, you should clear the stored data:
   ```dart
   Future<void> logout() async {
     final sharedPreferences = serviceLocator<SharedPreferences>();
     await sharedPreferences.remove('userType');
     await sharedPreferences.remove('token');
     // Navigate back to login screen or initial screen
   }
   ```

This setup ensures that upon successful login, the user's type and token are stored locally. When the app starts, it checks if there's stored user data to determine whether to show the login screen or directly navigate to the appropriate dashboard. Adjust the redirection logic (`initialRoute` in `MyApp`) based on your actual dashboard screens and routes.


 */