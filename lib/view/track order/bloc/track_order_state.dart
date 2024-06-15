part of 'track_order_bloc.dart';

sealed class TrackOrderState extends Equatable {
  const TrackOrderState();
  
  @override
  List<Object> get props => [];
}

final class TrackOrderInitialState extends TrackOrderState {}
final class TrackOrderLoadingState extends TrackOrderState {}
final class TrackOrderEmptygState extends TrackOrderState {}
final class TrackOrderSucsessState extends TrackOrderState {
  final  List<Order> ordersList ;
const TrackOrderSucsessState({required this.ordersList}); 
}
final class TrackOrderErrorState extends TrackOrderState {
  final String? errorMessage;
  const TrackOrderErrorState({required this.errorMessage}); 
}
