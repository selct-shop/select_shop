import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prod_deta_gen_event.dart';
part 'prod_deta_gen_state.dart';

class ProdDetaGenBloc extends Bloc<ProdDetaGenEvent, ProdDetaGenState> {
  ProdDetaGenBloc() : super(ProdDetaGenInitial()) {
    on<ProdDetaGenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
