part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}
final class HomeLoadingState extends HomeState {}
final class HomeLoadedState extends HomeState {}
final class HomeErrorState extends HomeState {}
// final class HomeLoadingState extends HomeState {}


final class HomeDrawerLoadingState extends HomeState {}
final class HomeDrawerLoadedState extends HomeState {}
final class HomeDrawerErrorState extends HomeState {}
