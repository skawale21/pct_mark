import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/features/tenant_features/help_screen/domain/repository/UseCases/edit_complaint.dart';

part 'edit_complaint_event.dart';
part 'edit_complaint_state.dart';

class EditComplaintBloc extends Bloc<EditComplaintEvent, EditComplaintState> {
  final NewComplaint _newComplaint;
  EditComplaintBloc({required NewComplaint newComplaint})
      : _newComplaint = newComplaint,
        super(EditComplaintInitial()) {
    on<EditComplaintEvent>(editComplaintEvent);
    on<EditComplaintSendButtonClickEvent>(editComplaintSendButtonClickEvent);
  }

  FutureOr<void> editComplaintEvent(
      EditComplaintEvent event, Emitter<EditComplaintState> emit) {}

  FutureOr<void> editComplaintSendButtonClickEvent(
      EditComplaintSendButtonClickEvent event,
      Emitter<EditComplaintState> emit) async {
    final newCompalint = await _newComplaint(NewComplaintParams(
        tenentId: '66add4276d37726eac83cd7a', message: 'Cleaning process'));
    newCompalint.fold((left) {
      emit(EditComplaintErrorActionState());
    }, (newCompalint) {
      emit(EditComplaintSuccessActionState());
    });
  }
}
