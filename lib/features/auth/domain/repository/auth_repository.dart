import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> brokerLogin({
    required String userName,
    required String password,
  });

  Future<Either<Failure, String>> tenantLogin({
    required String userName,
    required String password,
  });
}
