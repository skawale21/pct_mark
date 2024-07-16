// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/core/usecase/usecase.dart';
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';

class BrokerLogin implements UseCase<String, BrokerLoginParams> {
  final AuthRepository authRepository;

  BrokerLogin(this.authRepository);
  @override
  Future<Either<Failure, String>> call(BrokerLoginParams params) async {
    return await authRepository.brokerLogin(
        userName: params.userName, password: params.password);
  }
}

class BrokerLoginParams {
  String userName;
  String password;
  BrokerLoginParams({
    required this.userName,
    required this.password,
  });
}
