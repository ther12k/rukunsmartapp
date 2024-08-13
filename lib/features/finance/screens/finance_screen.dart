import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_event.dart';
import 'package:rukunsmart/features/finance/bloc/finance_state.dart';
import 'package:rukunsmart/features/finance/widgets/transaction_list_widget.dart';
import '../../../shared/widgets/custom_button.dart';

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
          if (state is FinanceInitial) {
            context.read<FinanceBloc>().add(LoadFinanceData());
            return const Center(child: CircularProgressIndicator());
          } else if (state is FinanceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FinanceLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Balance: \$${state.balance.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium),
                      CustomButton(
                        text: 'Add Transaction',
                        onPressed: () {
                          _showAddTransactionDialog(context);
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
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showAddTransactionDialog(BuildContext context) {
    final amountController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Transaction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            CustomButton(
              text: 'Cancel',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CustomButton(
              text: 'Add',
              onPressed: () {
                final amount = double.tryParse(amountController.text) ?? 0;
                final description = descriptionController.text;

                if (amount != 0 && description.isNotEmpty) {
                  context.read<FinanceBloc>().add(
                        AddTransaction(amount, description),
                      );
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
