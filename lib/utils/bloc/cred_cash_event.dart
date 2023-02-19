part of 'cred_cash_bloc.dart';

abstract class CredCashEvent {}

class UpdateCredit extends CredCashEvent {
  final CredCash credCash;

  UpdateCredit(this.credCash);
}

class CalulateEmi extends CredCashEvent {}
