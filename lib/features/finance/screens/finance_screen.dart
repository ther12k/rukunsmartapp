import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_state.dart';
import 'package:rukunsmart/features/finance/widgets/transaction_list_widget.dart';
import '../bloc/finance_bloc.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/loading_indicator.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Details'),
      ),
      body: BlocBuilder<FinanceBloc, FinanceState>(
        builder: (context, state) {
          if (state is FinanceLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is FinanceLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Balance: ${state.balance}',
                          style: Theme.of(context).textTheme.titleMedium),
                      CustomButton(
                        text: 'Add Transaction',
                        onPressed: () {
                          // TODO: Implement add transaction functionality
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TransactionList(transactions: state.transactions),
                ),
              ],
            );
          } else if (state is FinanceError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
