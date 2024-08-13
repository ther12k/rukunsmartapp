
import 'package:rukunsmart/features/finance/models/transaction_model.dart';

abstract class FinanceState {}

class FinanceInitial extends FinanceState {}

class FinanceLoading extends FinanceState {}

class FinanceLoaded extends FinanceState {
  final double balance;
  final double totalIncome;
  final double totalExpenses;
  final List<Transaction> transactions;

  FinanceLoaded({
    required this.balance,
    required this.totalIncome,
    required this.totalExpenses,
    required this.transactions,
  });
}

class FinanceError extends FinanceState {
  final String message;
  FinanceError(this.message);
}