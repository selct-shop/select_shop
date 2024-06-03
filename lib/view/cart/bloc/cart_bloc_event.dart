part of 'cart_bloc_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitalEvent extends CartEvent{


}
