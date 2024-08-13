import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_event.dart';

class ComplaintForm extends StatefulWidget {
  const ComplaintForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  final _formKey = GlobalKey<FormState>();
  final _complaintController = TextEditingController();

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }

  void _submitComplaint() {
    if (_formKey.currentState?.validate() ?? false) {
      final complaintDetails = _complaintController.text;
      context.read<ComplaintBloc>().add(SubmitComplaint(complaintDetails));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _complaintController,
              decoration: const InputDecoration(labelText: 'Complaint Details'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your complaint';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitComplaint,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
