part of 'adding_to_cart_button_bloc.dart';

sealed class AddingToCartButtonState extends Equatable {
  const AddingToCartButtonState();
  
  @override
  List<Object> get props => [];
}

final class AddiiiingToCartButtonInitialState extends AddingToCartButtonState {}
final class AddiiiingToCartButtonLoadingState extends AddingToCartButtonState {}
final class AddiiiingToCartButtonSuccessState extends AddingToCartButtonState {}
final class AddiiiingToCartButtonErrorState extends AddingToCartButtonState {
  final String? errorMessage;
  AddiiiingToCartButtonErrorState({required this.errorMessage}); 
}
