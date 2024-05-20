part of 'product_of_main_category_bloc.dart';

sealed class ProductsOfMainCategoryState extends Equatable {
  const ProductsOfMainCategoryState();

  @override
  List<Object> get props => [];
}

// #### main states #### //
final class ProductsOfMainCategoryInitialState
    extends ProductsOfMainCategoryState {}

final class ProductsOfMainCategoryLoadingState
    extends ProductsOfMainCategoryState {}

final class ProductsOfMainCategoryLoadedState
    extends ProductsOfMainCategoryState {}

final class ProductsOfMainCategoryErrorState
    extends ProductsOfMainCategoryState {}
// final class ProductsOfMainCategory extends ProductsOfMainCategoryState {}

// // #### secondry states #### //

// final class ProductsOfMainCategoryGetSubCategoryProductsState
//     extends ProductsOfMainCategoryState {}

// // #### #### //
// // working with the sub categories: {loading, error, succsess}
// // get the sub categories names and details
// final class ProductsOfMainCategoryGetSubCategoriesLoadingState
//     extends ProductsOfMainCategoryState {}

// final class ProductsOfMainCategoryGetSubCategoriesSuccessState
//     extends ProductsOfMainCategoryState {}

// final class ProductsOfMainCategoryGetSubCategoriesErrorState
//     extends ProductsOfMainCategoryState {}



// // #### #### //
// // working with the sub category product: {loading, error, succsess}
// // get the sub products names and details
// final class ProductsOfMainCategoryGetSubCategoryProductsLoadingState
//     extends ProductsOfMainCategoryState {}

// final class ProductsOfMainCategoryGetSubCategoryProductsSuccessState
//     extends ProductsOfMainCategoryState {}

// final class ProductsOfMainCategoryGetSubCategoryProductsErrorState
//     extends ProductsOfMainCategoryState {}



// // #### get all products #### // 
// final class ProductsOfMainCategoryGetAllProductsOfMainCategoryLoadingState
//     extends ProductsOfMainCategoryState {}
