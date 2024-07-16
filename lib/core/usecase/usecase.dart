import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
