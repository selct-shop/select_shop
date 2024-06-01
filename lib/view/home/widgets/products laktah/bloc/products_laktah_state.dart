part of 'products_laktah_bloc.dart';

sealed class ProductsLaktahState extends Equatable {
  const ProductsLaktahState();
  
  @override
  List<Object> get props => [];
}

final class ProductsLaktahInitalState extends ProductsLaktahState {}



  
// home drawer states
final class ProductsLaktahLoadingState extends ProductsLaktahState {}
final class ProductsLaktahSucsessState extends ProductsLaktahState {
  final List<TheCollectionProduct> newProductCollectionList;
  final TheCollectionModel theCollectionModel;

  ProductsLaktahSucsessState({ required this.newProductCollectionList, 
  required this.theCollectionModel, 
  });
}
final class ProductsLaktahEmptyState extends ProductsLaktahState {
  final List<TheCollectionProduct> newProductCollectionList;

  final TheCollectionModel theCollectionModel;

  ProductsLaktahEmptyState({ required this.newProductCollectionList, 
  
  required this.theCollectionModel, 
  }); 
}
final class ProductsLaktahErrorState extends ProductsLaktahState {
  final String? errorMessage;
  ProductsLaktahErrorState({required this.errorMessage});
}
