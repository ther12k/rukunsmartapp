import 'package:equatable/equatable.dart';

abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();

  @override
  List<Object> get props => [];
}

class PostComplaint extends ComplaintEvent {
  final String description;

  const PostComplaint(this.description);

  @override
  List<Object> get props => [description];
}

class FetchComplaints extends ComplaintEvent {}