part of 'edit_complaint_bloc.dart';

sealed class EditComplaintState extends Equatable {
  const EditComplaintState();

  @override
  List<Object> get props => [];
}

final class EditComplaintInitial extends EditComplaintState {}

final class EditComplaintActionState extends EditComplaintState {}

final class EditComplaintSuccessActionState extends EditComplaintActionState {}

final class EditComplaintErrorActionState extends EditComplaintActionState {}
