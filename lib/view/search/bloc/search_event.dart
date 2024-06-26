part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchProduct extends SearchEvent {
  final String theValueToBeSearched;

  SearchProduct({
    required this.theValueToBeSearched,
  });
}
