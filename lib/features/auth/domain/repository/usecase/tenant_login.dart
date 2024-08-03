// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/core/usecase/usecase.dart';
import 'package:pct_mark/features/auth/domain/entities/tenant_entity.dart';
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';

class TenantLogin implements UseCase<TenantEntity, TenantLoginParams> {
  final AuthRepository authRepository;

  TenantLogin(this.authRepository);
  @override
  Future<Either<Failure, TenantEntity>> call(TenantLoginParams params) async {
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
