import 'package:equatable/equatable.dart';

abstract class FinanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFinanceData extends FinanceEvent {}

class AddTransaction extends FinanceEvent {
  final double amount;
  final String description;

  AddTransaction(this.amount, this.description);

  @override
  List<Object?> get props => [amount, description];
}
