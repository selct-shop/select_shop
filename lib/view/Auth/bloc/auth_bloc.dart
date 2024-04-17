import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is AuthLogInEvent) {
        // DioHelper.getData(url: DioHelper.baseUrl);
        await DioHelper.login(phoneNumber: '971542287649', password: '19961996');
      }

      if (event is AuthSignupEvet) {}
    });
  }
}
