// part of 'product_of_main_category_bloc.dart';

// sealed class ProductOfCategoryEvent extends Equatable {
//   const ProductOfCategoryEvent();

//   @override
//   List<Object> get props => [];
// }

// // class ProductOfCategory

// // #### inital event #### // 
// // initalzation of all the requerd files  
// final class ProductsOfCategoryInitalEvent extends ProductOfCategoryEvent {
//   final int theMainCategoryID;

//   const ProductsOfCategoryInitalEvent({
//     required this.theMainCategoryID,
//   });
// }

// // get the all the products of the main category
// final class GetAllTheProductsOfTheMainCategoryEvent extends ProductOfCategoryEvent {
//   final int theMainCategoryID;

//   const GetAllTheProductsOfTheMainCategoryEvent({
//     required this.theMainCategoryID,
//   });
// }


// // get the main category children ( subCategory )
// final class GetTheSubCategoryOfTheMainCategoryEvent extends ProductOfCategoryEvent {
//   final int theMainCategoryID;

//   const GetTheSubCategoryOfTheMainCategoryEvent({required this.theMainCategoryID});
// }


// // get the products of the child ( the subCategory )
// final class GetTheProductsOfTheSubCategoryEvent extends ProductOfCategoryEvent {
// final int theSubCategoryID ;
// const GetTheProductsOfTheSubCategoryEvent({ required this.theSubCategoryID, }); 
// }
