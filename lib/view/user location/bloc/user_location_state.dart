part of 'user_location_bloc.dart';

sealed class UserLocationState extends Equatable {
  const UserLocationState();
  
  @override
  List<Object> get props => [];
}

final class UserLocationInitial extends UserLocationState {}
