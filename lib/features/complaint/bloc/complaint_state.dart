// States
import 'package:equatable/equatable.dart';

abstract class ComplaintState extends Equatable {
  const ComplaintState();

  @override
  List<Object> get props => [];
}

class ComplaintInitial extends ComplaintState {}

class ComplaintSubmitting extends ComplaintState {}

class ComplaintSubmitted extends ComplaintState {}

class ComplaintError extends ComplaintState {
  final String message;

  const ComplaintError(this.message);

  @override
  List<Object> get props => [message];
}
