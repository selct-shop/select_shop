part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

final class CategoriesInitialState extends CategoriesState {}
final class CategoriesLoadingState extends CategoriesState {}
final class CategoriesErrorState extends CategoriesState {
  final String errorMessage;
  CategoriesErrorState({required this.errorMessage});
}
final class CategoriesSuccsessState extends CategoriesState {}
// final class CategoriesGetDataState extends CategoriesState {}
