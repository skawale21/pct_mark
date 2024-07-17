import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/features/auth/domain/entities/booked_tenant_entity.dart';
import 'package:pct_mark/features/auth/domain/entities/broker_login_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, BrokerLoginEntity>> brokerLogin({
    required String userName,
    required String password,
  });

  Future<Either<Failure, BookedTenentEntity>> tenantLogin({
    required String userName,
    required String password,
  });
}
