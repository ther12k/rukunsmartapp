import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_state.dart';
import 'package:rukunsmart/features/complaint/widgets/complain_list.dart';
import 'package:rukunsmart/features/complaint/widgets/complaint_form_widget.dart';
import '../bloc/complaint_bloc.dart';
import '../../../shared/widgets/loading_indicator.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      body: BlocConsumer<ComplaintBloc, ComplaintState>(
        listener: (context, state) {
          if (state is ComplaintPostSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Complaint posted successfully')),
            );
          } else if (state is ComplaintPostFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Failed to post complaint: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          if (state is ComplaintLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is ComplaintsFetchSuccess) {
            return ComplaintList(complaints: state.complaints);
          } else if (state is ComplaintsFetchFailure) {
            return Center(
                child: Text('Failed to fetch complaints: ${state.error}'));
          } else {
            return const Center(
                child: Text('Press the button to fetch complaints'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showComplaintDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showComplaintDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ComplaintFormDialog(),
    );
  }
}
