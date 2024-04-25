import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {


    setToken( )async{
  CacheHelper.setData(key: "userToken", value: 'value');
}
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is AuthLogInEvent) {
        // DioHelper.getData(url: DioHelper.baseUrl);
        emit(AuthLoadingState());
        // setToken();
        await DioHelper.login(phoneNumber: '971542287649', password: '19961996');
      }

      if (event is AuthSignupEvet) {}
    });
  }
}
