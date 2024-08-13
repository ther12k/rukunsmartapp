import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_event.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_state.dart';
import 'package:rukunsmart/features/complaint/widgets/complaint_form_widget.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Complaint'),
      ),
      body: BlocBuilder<ComplaintBloc, ComplaintState>(
        builder: (context, state) {
          if (state is ComplaintInitial) {
            return const ComplaintForm();
          } else if (state is ComplaintSubmitting) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ComplaintSubmitted) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 64),
                  const SizedBox(height: 16),
                  const Text('Complaint submitted successfully!'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ComplaintBloc>().add(ResetComplaint());
                    },
                    child: const Text('Submit Another Complaint'),
                  ),
                ],
              ),
            );
          } else if (state is ComplaintError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
