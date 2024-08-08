// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:pct_mark/core/error/failures.dart';
import 'package:pct_mark/core/usecase/usecase.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/entities/new_complaint_entity.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/repository/edit_complaint_repository.dart';

class NewComplaint implements UseCase<NewComplaintEntity, NewComplaintParams> {
  final NewComplaintRepository newComplaintRepository;

  NewComplaint(this.newComplaintRepository);

  @override
  Future<Either<Failure, NewComplaintEntity>> call(params) async {
    return await newComplaintRepository.newComplaint(
        tenentId: params.tenentId, message: params.message);
  }
}

class NewComplaintParams {
  String tenentId;
  String message;
  NewComplaintParams({
    required this.tenentId,
    required this.message,
  });
}
