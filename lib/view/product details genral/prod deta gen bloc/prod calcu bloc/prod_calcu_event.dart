part of 'prod_calcu_bloc.dart';

sealed class ProdCalcuEvent extends Equatable {
  const ProdCalcuEvent();

  @override
  List<Object> get props => [];
}

class ProdCalcuInitalEvent extends ProdCalcuEvent {
  final productID;
 const ProdCalcuInitalEvent({ required this.productID});  
}