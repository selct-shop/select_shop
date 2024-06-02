import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pro_of_cat_event.dart';
part 'pro_of_cat_state.dart';

class ProOfCatBloc extends Bloc<ProOfCatEvent, ProOfCatState> {
  ProOfCatBloc() : super(ProOfCatInitialState()) {
    on<ProOfCatEvent>((event, emit) {
      // TODO: implement event handler

      
    });
  }
}
