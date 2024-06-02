part of 'sup_categories_of_main_category_bloc.dart';

sealed class SupCategoriesOfMainCategoryState extends Equatable {
  const SupCategoriesOfMainCategoryState();
  
  @override
  List<Object> get props => [];
}

final class SupCategoriesOfMainCategoryInitialState extends SupCategoriesOfMainCategoryState {}
final class SupCategoriesOfMainCategoryLoadingState extends SupCategoriesOfMainCategoryState {}
final class SupCategoriesOfMainCategorySucsessState extends SupCategoriesOfMainCategoryState {
final SubCategoriesOfMainCategoresModle subCategoriesOfMainCategoresModle;
SupCategoriesOfMainCategorySucsessState({ required this.subCategoriesOfMainCategoresModle}); 

}
final class SupCategoriesOfMainCategoryEmptyState extends SupCategoriesOfMainCategoryState {
  
final SubCategoriesOfMainCategoresModle subCategoriesOfMainCategoresModle;
SupCategoriesOfMainCategoryEmptyState({ required this.subCategoriesOfMainCategoresModle}); 

}
final class SupCategoriesOfMainCategoryErrorState extends SupCategoriesOfMainCategoryState {
  final String? errorMessage;
  SupCategoriesOfMainCategoryErrorState({ required this.errorMessage}); 
}
