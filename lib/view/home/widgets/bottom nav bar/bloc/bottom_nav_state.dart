part of 'bottom_nav_bloc.dart';

sealed class BottomNavState extends Equatable {
  const BottomNavState();
  
  @override
  List<Object> get props => [];
}

final class BottomNavInitialState extends BottomNavState {}
final class BottomNavloadingState extends BottomNavState {}
final class BottomNavSucsessState extends BottomNavState {}
