part of 'product_of_category_bloc.dart';

sealed class ProductOfCategoryState extends Equatable {
  const ProductOfCategoryState();
  
  @override
  List<Object> get props => [];
}


// #### main states #### //
final class ProductOfCategoryInitialState extends ProductOfCategoryState {}
final class ProductOfCategoryLoadingState extends ProductOfCategoryState {}
final class ProductOfCategoryLoadedState extends ProductOfCategoryState {}
final class ProductOfCategoryErrorState extends ProductOfCategoryState {}
// final class ProductOfCategory extends ProductOfCategoryState {}


// #### secondry states #### // 
final class ProductsOfCategoryGetSubCategoryProductsState extends ProductOfCategoryState {}

final class ProductsOfCategoryGetAllProductsOfMainCategoryState extends ProductOfCategoryState {}

