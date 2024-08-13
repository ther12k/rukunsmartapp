import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_event.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_state.dart';
import '../repositories/complaint_repository.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  final ComplaintRepository _complaintRepository;

  ComplaintBloc(
    ComplaintRepository complaintRepository, {
    ComplaintInitial? initialState,
  })  : _complaintRepository = complaintRepository,
        super(initialState ?? ComplaintInitial());

  ComplaintBloc.withRepository(
      {required ComplaintRepository complaintRepository})
      : _complaintRepository = complaintRepository,
        super(ComplaintInitial()) {
    on<PostComplaint>(_onPostComplaint);
    on<FetchComplaints>(_onFetchComplaints);
  }

  Future<void> _onPostComplaint(
      PostComplaint event, Emitter<ComplaintState> emit) async {
    emit(ComplaintLoading());
    try {
      final complaint =
          await _complaintRepository.postComplaint(event.description);
      emit(ComplaintPostSuccess(complaint));
      add(FetchComplaints()); // Refresh the list after posting
    } catch (e) {
      emit(ComplaintPostFailure(e.toString()));
    }
  }

  Future<void> _onFetchComplaints(
      FetchComplaints event, Emitter<ComplaintState> emit) async {
    emit(ComplaintLoading());
    try {
      final complaints = await _complaintRepository.fetchComplaints();
      emit(ComplaintsFetchSuccess(complaints));
    } catch (e) {
      emit(ComplaintsFetchFailure(e.toString()));
    }
  }
}
