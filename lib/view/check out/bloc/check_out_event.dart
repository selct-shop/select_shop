part of 'check_out_bloc.dart';

sealed class CheckOutEvent extends Equatable {
  const CheckOutEvent();

  @override
  List<Object> get props => [];
}

class ChangePaymentMethodEvent extends CheckOutEvent {
  final int paymentMethod;
ChangePaymentMethodEvent({required this.paymentMethod}); 


}
