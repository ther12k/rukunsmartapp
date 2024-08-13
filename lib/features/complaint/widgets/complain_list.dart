import 'package:flutter/material.dart';
import '../models/complaint_model.dart';

class ComplaintList extends StatelessWidget {
  final List<Complaint> complaints;

  const ComplaintList({super.key, required this.complaints});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        final complaint = complaints[index];
        return ListTile(
          title: Text(complaint.description),
          subtitle: Text('Status: ${complaint.status}'),
          trailing: Text(complaint.date.toString().split(' ')[0]),
        );
      },
    );
  }
}