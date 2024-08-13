import 'package:flutter/material.dart';
import 'package:rukunsmart/features/finance/models/transaction_model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: Text(transaction.description),
          subtitle: Text(transaction.date.toString()),
          trailing: Text(
            '${transaction.amount > 0 ? '+' : ''}${transaction.amount}',
            style: TextStyle(
              color: transaction.amount > 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
