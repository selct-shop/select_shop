part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  
  @override
  List<Object> get props => [];
}

final class ProductDetailsInitialState extends ProductDetailsState {}
final class ProductDetailsLoadingState extends ProductDetailsState {}
final class ProductDetailsSucsessState extends ProductDetailsState {
  final TheCollectionProduct theCollectionProduct;
  ProductDetailsSucsessState({ required this.theCollectionProduct});
}
final class ProductDetailsErrorState extends ProductDetailsState {
  final String? theErrorMessage;
  ProductDetailsErrorState({required this.theErrorMessage}); 
}



final class ProductDetailsAddedToCartState extends ProductDetailsState {
  // final String? theErrorMessage;
  // ProductDetailsAddedToCartState({required this.theErrorMessage}); 
}
