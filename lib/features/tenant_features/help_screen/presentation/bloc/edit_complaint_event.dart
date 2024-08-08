part of 'edit_complaint_bloc.dart';

sealed class EditComplaintEvent extends Equatable {
  const EditComplaintEvent();

  @override
  List<Object> get props => [];
}

final class EditComplaintSendButtonClickEvent extends EditComplaintEvent {
  final String complaintDesc;

  const EditComplaintSendButtonClickEvent({required this.complaintDesc});
}
