import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  UserLocationBloc() : super(UserLocationInitial()) {
    on<UserLocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
