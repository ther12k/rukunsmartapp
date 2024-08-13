import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_event.dart';
import 'package:rukunsmart/features/finance/bloc/finance_state.dart';
import 'package:rukunsmart/features/finance/repositories/finance_repository.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  final FinanceRepository financeRepository;

  FinanceBloc(this.financeRepository) : super(FinanceInitial()) {
    on<LoadFinanceData>(_onLoadFinanceData);
    on<AddTransaction>(_onAddTransaction);
  }

  void _onLoadFinanceData(
      LoadFinanceData event, Emitter<FinanceState> emit) async {
    emit(FinanceLoading());
    try {
      final transactions = await financeRepository.fetchTransactions();
      double totalIncome = transactions
          .where((transaction) => transaction.amount > 0)
          .fold(0, (sum, item) => sum + item.amount);
      double totalExpenses = transactions
          .where((transaction) => transaction.amount < 0)
          .fold(0, (sum, item) => sum + item.amount);
      emit(FinanceLoaded(
        balance: totalIncome + totalExpenses,
        totalIncome: totalIncome,
        totalExpenses: totalExpenses,
        transactions: transactions,
      ));
    } catch (e) {
      emit(FinanceError(e.toString()));
    }
  }

  void _onAddTransaction(
      AddTransaction event, Emitter<FinanceState> emit) async {
    // Implement logic to add a new transaction
  }
}
