part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}
final class HomeLoadingState extends HomeState {}
final class HomeLoadedState extends HomeState {}
final class HomeErrorState extends HomeState {}
// final class HomeLoadingState extends HomeState {}

// home drawer states
final class HomeDrawerLoadingState extends HomeState {}
final class HomeDrawerLoadedState extends HomeState {}
final class HomeDrawerErrorState extends HomeState {}

// get catigoris states
final class HomeGetHomeCatiegorInitalState extends HomeState{}
final class HomeGetHomeCatiegorLoadingState extends HomeState{}
final class HomeGetHomeCatiegorsucseesState extends HomeState{}
final class HomeGetHomeCatiegorErrorState extends HomeState{
  final String? errorMessage;

  HomeGetHomeCatiegorErrorState({ 
    required this.errorMessage, 
  });
}

  
// home drawer states
final class HomeNewProductsLoadingState extends HomeState {}
final class HomeNewProductLoadedState extends HomeState {
  final List<CollectionProduct> newProductCollectionList;
  HomeNewProductLoadedState({ required this.newProductCollectionList});
}
final class HomeNewProductEmptyState extends HomeState {
  final List<CollectionProduct> newProductCollectionList;
  HomeNewProductEmptyState({ required this.newProductCollectionList}); 
}
final class HomeNewProductErrorState extends HomeState {
  final String? errorMessage;
  HomeNewProductErrorState({required this.errorMessage});
}

