part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {}

  //
  //
  // #### search defalt states #### //

final class SearchLoadingState extends SearchState {}
final class SearchSucsessState extends SearchState {}
final class SearchErrorState extends SearchState {}

  //
  //
  // #### search custom states #### //

final class SearchNoResultState extends SearchState {}