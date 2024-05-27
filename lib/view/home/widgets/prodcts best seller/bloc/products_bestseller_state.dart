part of 'product_bestseller_bloc.dart';

sealed class ProductsBestsellerState extends Equatable {
  const ProductsBestsellerState();
  
  @override
  List<Object> get props => [];
}

final class ProductsBestSellerInitalState extends ProductsBestsellerState {}



  
// home drawer states
final class ProductsBestSellerLoadingState extends ProductsBestsellerState {}
final class ProductsBestSellerLoadedState extends ProductsBestsellerState {
  final List<CollectionProduct> bestSellerCollectionList;
  ProductsBestSellerLoadedState({ required this.bestSellerCollectionList});
}
final class ProductsBestSellerEmptyState extends ProductsBestsellerState {
  final List<CollectionProduct> bestSellerCollectionList;
  ProductsBestSellerEmptyState({ required this.bestSellerCollectionList}); 
}
final class ProductsBestSellerErrorState extends ProductsBestsellerState {
  final String? errorMessage;
  ProductsBestSellerErrorState({required this.errorMessage});
}
