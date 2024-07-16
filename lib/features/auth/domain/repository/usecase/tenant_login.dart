// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/core/usecase/usecase.dart';
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';

class TenantLogin implements UseCase<String, TenantLoginParams> {
  final AuthRepository authRepository;

  TenantLogin(this.authRepository);
  @override
  Future<Either<Failure, String>> call(TenantLoginParams params) async {
    return await authRepository.tenantLogin(
        userName: params.userName, password: params.password);
  }
}

class TenantLoginParams {
  String userName;
  String password;
  TenantLoginParams({
    required this.userName,
    required this.password,
  });
}
