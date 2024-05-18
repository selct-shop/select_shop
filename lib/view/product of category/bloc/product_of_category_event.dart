part of 'product_of_category_bloc.dart';

sealed class ProductOfCategoryEvent extends Equatable {
  const ProductOfCategoryEvent();

  @override
  List<Object> get props => [];
}

// class ProductOfCategory

// get the main category children ( subCategory )
final class GetTheMainCategoryChildrenEvent extends ProductOfCategoryEvent {
  final int theMainCategoryID;

  const GetTheMainCategoryChildrenEvent({required this.theMainCategoryID});
}

// get the products of the main category

final class GetTheProductsOfTheMainCategoryEvent extends ProductOfCategoryEvent {
  final int theMainCategoryID;

  const GetTheProductsOfTheMainCategoryEvent({
    required this.theMainCategoryID,
  });
}

// get the products of the child
final class GetTheProductsOfTheSubCategoryEvent extends ProductOfCategoryEvent {
final int theSubCategoryID ;

const GetTheProductsOfTheSubCategoryEvent({ required this.theSubCategoryID, }); 


}
