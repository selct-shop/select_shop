part of 'user_location_bloc.dart';

sealed class UserLocationEvent extends Equatable {
  const UserLocationEvent();

  @override
  List<Object> get props => [];


}


class GetAllEmirateEvent extends UserLocationEvent {}
class GetLocalLocationsEvent extends UserLocationEvent {}
class AddUserLocationEvent extends UserLocationEvent {
  final LocalLocationModel localLocationModel; 
AddUserLocationEvent({ required this.localLocationModel}); 

}