import 'package:cred/models/cred_cash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cred_cash_event.dart';
part 'cred_cash_state.dart';

class CredCashBloc extends Bloc<CredCashEvent, CredCashState> {
  CredCashBloc() : super(CredCashInitial()) {
    on<UpdateCredit>(_updateCredit);
  }

  CredCash credCash = CredCash();

  _updateCredit(UpdateCredit event, Emitter<CredCashState> emit) {
    credCash = event.credCash;
  }
}
