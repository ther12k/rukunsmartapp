import 'package:rukunsmart/features/finance/models/transaction_model.dart';

abstract class FinanceEvent {}

class LoadFinanceData extends FinanceEvent {}

class AddTransaction extends FinanceEvent {
  final Transaction transaction;
  AddTransaction(this.transaction);
}
