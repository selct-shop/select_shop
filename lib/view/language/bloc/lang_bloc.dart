import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    on<LangEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
