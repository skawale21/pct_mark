import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/entities/new_complaint_entity.dart';

abstract interface class NewComplaintRepository {
  Future<Either<Failure, NewComplaintEntity>> newComplaint({
    required String tenentId,
    required String message,
  });
}
