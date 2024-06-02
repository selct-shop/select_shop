part of 'pro_of_cat_bloc.dart';

sealed class ProOfCatEvent extends Equatable {
  const ProOfCatEvent();

  @override
  List<Object> get props => [];
}

class ProOfCatInitalEvent extends ProOfCatEvent {
  final int mainCatID;
  ProOfCatInitalEvent({required this.mainCatID}); 
}