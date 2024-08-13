import 'package:rukunsmart/features/billing/models/billing_model.dart';

abstract class BillingState {}

class BillingInitial extends BillingState {}

class BillingLoading extends BillingState {}

class BillingLoaded extends BillingState {
  final List<Bill> bills;
  BillingLoaded(this.bills);
}

class BillingError extends BillingState {
  final String message;
  BillingError(this.message);
}
