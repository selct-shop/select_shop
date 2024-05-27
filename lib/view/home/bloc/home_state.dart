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

