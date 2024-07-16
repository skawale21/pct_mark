import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/exceptions.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/features/auth/data/datasources/auth_remote_remote_data_source.dart';
import 'package:pct_mark/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> brokerLogin(
      {required String userName, required String password}) async {
    try {
      final user = await remoteDataSource.brokerLogin(
          userName: userName, password: password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> tenantLogin(
      {required String userName, required String password}) {
    // TODO: implement tenantLogin
    throw UnimplementedError();
  }
}
