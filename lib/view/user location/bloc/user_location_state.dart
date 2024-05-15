part of 'user_location_bloc.dart';

sealed class UserLocationState extends Equatable {
  const UserLocationState();
  
  @override
  List<Object> get props => [];
}

final class UserLocationInitialState extends UserLocationState {}
final class LoadingAllEmiratesState extends UserLocationState {}
final class AllEmiratesStateLoadedState extends UserLocationState {}
final class GetAllEmiratesErrorState extends UserLocationState {
  String? errorMessage;
GetAllEmiratesErrorState({String? this.errorMessage, });
}
// final class UserLocationInitial extends UserLocationState {}
// final class UserLocationInitial extends UserLocationState {}
