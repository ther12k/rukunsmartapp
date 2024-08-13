import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_event.dart';
import '../bloc/complaint_bloc.dart';

class ComplaintFormDialog extends StatefulWidget {
  const ComplaintFormDialog({super.key});

  @override
  State<ComplaintFormDialog> createState() => _ComplaintFormDialogState();
}

class _ComplaintFormDialogState extends State<ComplaintFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _complaintController = TextEditingController();

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Post a Complaint'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _complaintController,
          decoration: const InputDecoration(hintText: 'Enter your complaint'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your complaint';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              context.read<ComplaintBloc>().add(PostComplaint(_complaintController.text));
              Navigator.pop(context);
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}