part of 'products_laktah_bloc.dart';

sealed class GetNewProductsState extends Equatable {
  const GetNewProductsState();
  
  @override
  List<Object> get props => [];
}

final class GetNewProductsInitial extends GetNewProductsState {}



  
// home drawer states
final class GetNewProductsLoadingState extends GetNewProductsState {}
final class GetNewProductLoadedState extends GetNewProductsState {
  final List<CollectionProduct> newProductCollectionList;
  GetNewProductLoadedState({ required this.newProductCollectionList});
}
final class GetNewProductEmptyState extends GetNewProductsState {
  final List<CollectionProduct> newProductCollectionList;
  GetNewProductEmptyState({ required this.newProductCollectionList}); 
}
final class GetNewProductErrorState extends GetNewProductsState {
  final String? errorMessage;
  GetNewProductErrorState({required this.errorMessage});
}
