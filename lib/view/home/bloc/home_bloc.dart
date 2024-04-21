import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int activePageNumber = 1;

  bottomNavBarTapded({
    required int newPageNumber,
  }) {
    activePageNumber = newPageNumber;
  }

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(
      (event, emit) {
        // TODO: implement event handler

        // print(
        //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent");

        if (event is BottomNavBarTapdedEvent) {
          emit(HomeLoadingState());

          // print("botttttttttttttttttttttom nav bar tapped  ");

          // bottomNavBarTapded(newPageNumber) {
          // activePageNumber == newPageNumber;
          // activePageNumber == BottomNavBarTapdedEvent. ;
          // }

          bottomNavBarTapded(newPageNumber: event.tappdedPageNumber);

          // activePageNumber = BottomNavBarTapdedEvent(tappdedPageNumber: tappdedPageNumber)

          emit(HomeLoadedState());
        }
      },
    );
  }
}
