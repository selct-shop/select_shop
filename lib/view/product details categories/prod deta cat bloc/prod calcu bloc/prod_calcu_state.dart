part of 'prod_calcu_bloc.dart';

sealed class ProdCalcuState extends Equatable {
  const ProdCalcuState();
  
  @override
  List<Object> get props => [];
}

final class ProdCalcuInitialState extends ProdCalcuState {}
final class ProdCalcuLoadingState extends ProdCalcuState {}
final class ProdCalcuSucsessState extends ProdCalcuState {
  final ProductCalculationsModel productCalculationsModel;
  ProdCalcuSucsessState({required this.productCalculationsModel}); 
}
final class ProdCalcuErrorState extends ProdCalcuState {
  final String? errorMessage;
  ProdCalcuErrorState({required this.errorMessage}); 
}
