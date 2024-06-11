part of 'check_out_bloc.dart';

sealed class CheckOutState extends Equatable {
  const CheckOutState();
  
  @override
  List<Object> get props => [];
}

final class CheckOutInitial extends CheckOutState {}
