part of 'cart_bloc_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}
final class CartLoadingState extends CartState {}
final class CartEmptyState extends CartState {}
final class CartSucsessState extends CartState {

  CartModel? cartModel; 
  CartSucsessState({ required this.cartModel});
}
final class CartErrorState extends CartState {

  String? errorMessage;
  CartErrorState({required  this.errorMessage});
}
