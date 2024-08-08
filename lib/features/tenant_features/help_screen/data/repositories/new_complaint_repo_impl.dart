import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/exceptions.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/features/tenant_features/help_screen/data/data_sources/new_complaint_remote_data_source.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/entities/new_complaint_entity.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/repository/edit_complaint_repository.dart';

class NewComplaintRepoImpl implements NewComplaintRepository {
  final NewComplaintRemoteDataSource remoteDataSource;

  NewComplaintRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, NewComplaintEntity>> newComplaint(
      {required String tenentId, required String message}) async {
    try {
      final newComplaint = await remoteDataSource.newComplaint(
          tenentId: tenentId, message: message);
      return Right(newComplaint);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}


  // @override
  // Future<Either<Failure, TenantEntity>> tenantLogin(
  //     {required String userName, required String password}) async {
  //   try {
  //     final user = await remoteDataSource.tenantLogin(
  //         userName: userName, password: password);
  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(Failure(e.message));
  //   }
  // }

