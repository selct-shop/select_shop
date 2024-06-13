import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_out_event.dart';
part 'check_out_state.dart';
// enum PaymentMethod {111,222}

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  int paymentMethod = 222;

  CheckOutBloc() : super(CheckOutInitialState()) {
    on<CheckOutEvent>((event, emit) {
      // TODO: implement event handler



      if (event is ChangePaymentMethodEvent) {
        emit(CheckOutReloadState());

        emit(CheckOutSucsessState(paymentMethod: paymentMethod));
      }
    });
  }
}
