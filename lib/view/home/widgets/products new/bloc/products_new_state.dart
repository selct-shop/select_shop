part of 'products_new_bloc.dart';

sealed class ProductsNewState extends Equatable {
  const ProductsNewState();
  
  @override
  List<Object> get props => [];
}

final class ProductsNewInitalState extends ProductsNewState {}



  
// home drawer states
final class ProductsNewLoadingState extends ProductsNewState {}
final class ProductsNewSucsessState extends ProductsNewState {
  final List<TheCollectionProduct> newProductCollectionList;
  final TheCollectionModel theCollectionModel;

  ProductsNewSucsessState({ required this.newProductCollectionList, 
  
  required this.theCollectionModel, 
  });
}
final class ProductsNewEmptyState extends ProductsNewState {
  final List<TheCollectionProduct> newProductCollectionList;
  final TheCollectionModel theCollectionModel;
  
  ProductsNewEmptyState({ required this.newProductCollectionList
   , 
   required this.theCollectionModel, 
   
   }); 
}
final class ProductsNewErrorState extends ProductsNewState {
  final String? errorMessage;
  ProductsNewErrorState({required this.errorMessage});
}
