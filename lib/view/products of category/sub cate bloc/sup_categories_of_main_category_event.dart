part of 'sup_categories_of_main_category_bloc.dart';

sealed class SupCategoriesOfMainCategoryEvent extends Equatable {
  const SupCategoriesOfMainCategoryEvent();

  @override
  List<Object> get props => [];
}

final class SubCategoriesOfMainCateInitalEvent extends SupCategoriesOfMainCategoryEvent {
  final int mainCatID;
  SubCategoriesOfMainCateInitalEvent({required this.mainCatID}); 
}