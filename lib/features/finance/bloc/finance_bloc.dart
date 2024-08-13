import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_event.dart';
import 'package:rukunsmart/features/finance/bloc/finance_state.dart';
import 'package:rukunsmart/features/finance/models/transaction_model.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitial()) {
    on<LoadFinanceData>(_onLoadFinanceData);
    on<AddTransaction>(_onAddTransaction);
  }

  void _onLoadFinanceData(
      LoadFinanceData event, Emitter<FinanceState> emit) async {
    emit(FinanceLoading());
    try {
      // TODO: Implement logic to fetch finance data
      // For now, we'll use dummy data
      await Future.delayed(
          const Duration(seconds: 1)); // Simulate network delay
      emit(FinanceLoaded(
        balance: 10000,
        totalIncome: 15000,
        totalExpenses: 5000,
        transactions: [
          Transaction(
              id: '1',
              amount: 1000,
              description: 'Salary',
              date: DateTime.now()),
          Transaction(
              id: '2',
              amount: -500,
              description: 'Groceries',
              date: DateTime.now().subtract(const Duration(days: 1))),
        ],
      ));
    } catch (e) {
      emit(FinanceError(e.toString()));
    }
  }

  void _onAddTransaction(
      AddTransaction event, Emitter<FinanceState> emit) async {
    // TODO: Implement logic to add a new transaction
  }
}
