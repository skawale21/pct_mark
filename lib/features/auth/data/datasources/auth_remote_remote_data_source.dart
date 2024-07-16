// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/core/error/exceptions.dart';

abstract interface class AuthRemoteRemoteDataSource {
  Future<String> brokerLogin({
    required String username,
    required String password,
  });

  Future<String> tenantLogin({
    required String username,
    required String password,
  });
}

class AuthRemoteRemoteDataSourceImpl implements AuthRemoteRemoteDataSource {
  final HttpService httpService;
  AuthRemoteRemoteDataSourceImpl(
    this.httpService,
  );
  final client = http.Client();
  @override
  Future<String> brokerLogin(
      {required String username, required String password}) async {
    try {
      final response = await httpService.post(ApiEndPoints.brokerLogin,
          data: {'userName': username, 'password': password});
      if (response == null) {
        throw ServerException('User is null');
      }
      return response; //use .fromJson form model class
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> tenantLogin(
      {required String username, required String password}) async {
    try {
      final response = await httpService.post(ApiEndPoints.tenentLogin,
          data: {'userName': username, 'password': password});
      if (response == null) {
        throw ServerException('User is null');
      }
      return response; //use .fromJson form model class
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
