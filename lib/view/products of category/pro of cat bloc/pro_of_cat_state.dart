part of 'pro_of_cat_bloc.dart';

sealed class ProOfCatState extends Equatable {
  const ProOfCatState();
  
  @override
  List<Object> get props => [];
}

final class ProOfCatInitialState extends ProOfCatState {}
final class ProOfCatLoadingState extends ProOfCatState {}
final class ProOfCatSucsessState extends ProOfCatState {}
final class ProOfCatEmptyState extends ProOfCatState {}
final class ProOfCatErrorState extends ProOfCatState {}
