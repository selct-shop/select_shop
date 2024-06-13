part of 'check_out_bloc.dart';

sealed class CheckOutState extends Equatable {
  const CheckOutState();
  
  @override
  List<Object> get props => [];
}

final class CheckOutInitialState extends CheckOutState {}
final class CheckOutReloadState extends CheckOutState {}
final class CheckOutSucsessState extends CheckOutState {
  final int paymentMethod;
  CheckOutSucsessState({required this.paymentMethod}); 
}
