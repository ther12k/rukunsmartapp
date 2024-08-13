import 'package:rukunsmart/features/finance/models/transaction_model.dart';

class FinanceRepository {
  Future<List<Transaction>> fetchTransactions() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      Transaction(
        id: '1',
        amount: 1000,
        description: 'Salary',
        date: DateTime.now(),
      ),
      Transaction(
        id: '2',
        amount: -500,
        description: 'Groceries',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }
}
