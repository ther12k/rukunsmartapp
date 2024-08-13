import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/billing/bloc/billing_bloc.dart';
import 'package:rukunsmart/features/billing/bloc/billing_event.dart';
import 'package:rukunsmart/features/billing/bloc/billing_state.dart';
import '../widgets/bill_list.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Bills'),
      ),
      body: BlocBuilder<BillingBloc, BillingState>(
        builder: (context, state) {
          if (state is BillingInitial) {
            context.read<BillingBloc>().add(LoadBills());
            return const Center(child: CircularProgressIndicator());
          } else if (state is BillingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BillingLoaded) {
            return BillList(bills: state.bills);
          } else if (state is BillingError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
