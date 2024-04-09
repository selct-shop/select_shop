import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int activePageNumber = 1;
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler

      // print(
      //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent");

      if (event is BottomNavBarTapdedEvent) {
        emit(HomeLoadingState());
        print("botttttttttttttttttttttom nav bar tapped");

        bottomNavBarTapded(int newPageNumber) {
          activePageNumber = newPageNumber;

          print(
              "botttttttttttttttttttttom nav bar tapped  newpage number = $newPageNumber");

          emit(HomeLoadedState());
        }
      }
    });
  }
}
