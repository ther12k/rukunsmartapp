import 'package:equatable/equatable.dart';

// Events
abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();

  @override
  List<Object> get props => [];
}

class SubmitComplaint extends ComplaintEvent {
  final String complaintDetails;

  const SubmitComplaint(this.complaintDetails);

  @override
  List<Object> get props => [complaintDetails];
}

class ResetComplaint extends ComplaintEvent {}
