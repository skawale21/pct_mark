// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'package:pct_mark/core/app_data/data_model/tenant_data_model.dart';
import 'package:pct_mark/core/app_data/tenant_data.dart';
import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/core/error/exceptions.dart';
import 'package:pct_mark/features/auth/data/models/broker_model.dart';
import 'package:pct_mark/features/auth/data/models/tenant_model.dart';
import 'package:pct_mark/init_dependencies.dart';

abstract interface class AuthRemoteDataSource {
  Future<BrokerLoginModel> brokerLogin({
    required String userName,
    required String password,
  });

  Future<TenantModel> tenantLogin({
    required String userName,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpService httpService;
  AuthRemoteDataSourceImpl(
    this.httpService,
  );
  //remove below code in future
  final client = http.Client();
  final tenantDataService = serviceLocator<TenantDataService>();
  @override
  Future<BrokerLoginModel> brokerLogin(
      {required String userName, required String password}) async {
    try {
      final response = await httpService.post(ApiEndPoints.brokerLogin,
          data: {'userName': userName, 'password': password});
      if (response == null) {
        throw ServerException('User is null');
      }
      return BrokerLoginModel.fromJson(
          response); //use .fromJson form model class
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<TenantModel> tenantLogin(
      {required String userName, required String password}) async {
    try {
      final response = await httpService.post(ApiEndPoints.tenentLogin,
          data: {'userName': userName, 'password': password});
      if (response == null) {
        throw ServerException('User is null');
      }
      // tenantDataService.saveTenantData(TenantData.fromJson(response));
      await tenantDataService.saveTenantData(TenantData.fromJson(response));

      return TenantModel.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
