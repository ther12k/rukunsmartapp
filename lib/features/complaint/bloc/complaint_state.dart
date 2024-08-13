import 'package:equatable/equatable.dart';
import 'package:rukunsmart/features/complaint/models/complaint_model.dart';

abstract class ComplaintState extends Equatable {
  const ComplaintState();

  @override
  List<Object> get props => [];
}

class ComplaintInitial extends ComplaintState {}

class ComplaintLoading extends ComplaintState {}

class ComplaintPostSuccess extends ComplaintState {
  final Complaint complaint;

  const ComplaintPostSuccess(this.complaint);

  @override
  List<Object> get props => [complaint];
}

class ComplaintPostFailure extends ComplaintState {
  final String error;

  const ComplaintPostFailure(this.error);

  @override
  List<Object> get props => [error];
}

class ComplaintsFetchSuccess extends ComplaintState {
  final List<Complaint> complaints;

  const ComplaintsFetchSuccess(this.complaints);

  @override
  List<Object> get props => [complaints];
}

class ComplaintsFetchFailure extends ComplaintState {
  final String error;

  const ComplaintsFetchFailure(this.error);

  @override
  List<Object> get props => [error];
}
