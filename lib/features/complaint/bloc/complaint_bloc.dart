import 'package:flutter_bloc/flutter_bloc.dart';
import 'complaint_event.dart';
import 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc() : super(ComplaintInitial()) {
    on<SubmitComplaint>(_onSubmitComplaint);
    on<ResetComplaint>(_onResetComplaint);
  }

  Future<void> _onSubmitComplaint(
      SubmitComplaint event, Emitter<ComplaintState> emit) async {
    emit(ComplaintSubmitting());
    try {
      // Simulating API call delay for submitting a complaint
      await Future.delayed(const Duration(seconds: 3));

      // Assume the submission is successful, transition to ComplaintSubmitted state
      emit(ComplaintSubmitted());
    } catch (e) {
      // If there's an error, emit the ComplaintError state with an error message
      emit(const ComplaintError('Failed to submit the complaint.'));
    }
  }

  void _onResetComplaint(ResetComplaint event, Emitter<ComplaintState> emit) {
    emit(ComplaintInitial());
  }
}
