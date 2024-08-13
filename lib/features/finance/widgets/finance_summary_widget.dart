import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_state.dart';
import '../../finance/bloc/finance_bloc.dart';
import '../../../shared/widgets/loading_indicator.dart';

class FinanceSummary extends StatelessWidget {
  const FinanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Finance Summary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            BlocBuilder<FinanceBloc, FinanceState>(
              builder: (context, state) {
                if (state is FinanceLoading) {
                  return const Center(child: LoadingIndicator());
                } else if (state is FinanceLoaded) {
                  return Column(
                    children: [
                      _buildSummaryItem('Current Balance', '${state.balance}'),
                      _buildSummaryItem('Total Income', '${state.totalIncome}'),
                      _buildSummaryItem(
                          'Total Expenses', '${state.totalExpenses}'),
                    ],
                  );
                } else if (state is FinanceError) {
                  return Text('Error: ${state.message}');
                }
                return const Text('No financial data available');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
