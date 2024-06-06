part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class ProductDetailsInitalEvent extends ProductDetailsEvent {
  
}


class ProductDetailsAddToCartEvent extends ProductDetailsEvent {
  final int productAttrubuteId;

  ProductDetailsAddToCartEvent({ required this.productAttrubuteId });  
}
