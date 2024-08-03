import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/features/auth/domain/entities/broker_login_entity.dart';
import 'package:pct_mark/features/auth/domain/entities/tenant_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, BrokerLoginEntity>> brokerLogin({
    required String userName,
    required String password,
  });

  Future<Either<Failure, TenantEntity>> tenantLogin({
    required String userName,
    required String password,
  });
}
