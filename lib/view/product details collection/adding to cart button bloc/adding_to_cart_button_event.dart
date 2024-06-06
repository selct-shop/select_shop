part of 'adding_to_cart_button_bloc.dart';

sealed class AddingToCartButtonEvent extends Equatable {
  const AddingToCartButtonEvent();

  @override
  List<Object> get props => [];
}

class AddToCarrrtEvent extends AddingToCartButtonEvent {

final int productAttrubuteId;

AddToCarrrtEvent({required this.productAttrubuteId}); 

}