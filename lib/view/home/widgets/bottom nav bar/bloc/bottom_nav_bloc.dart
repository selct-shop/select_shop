import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  // int activePageNumber = 1;
  int activePageNumber = 3;

  bottomNavBarTapded({required int newPageNumber}) {
    activePageNumber = newPageNumber;
  }

  BottomNavBloc() : super(BottomNavInitialState()) {
    on<BottomNavEvent>((event, emit) {
      // TODO: implement event handler

      if (event is BottomNavBarTapdedEvent) {
        emit(BottomNavloadingState());

        // switch (event.tappdedPageNumber) {
        //   case 1:
        //     // 1 is the home
        //     activeDrawerPage = 1;
        //     // print(
        //     //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");

        //     break;

        //   case 2:
        //     // 2 is the categoryes
        //     activeDrawerPage = 2;

        //     // print(
        //     //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");
        //     break;

        //   case 3:
        //     // 3 is the favourest
        //     activeDrawerPage = 6;

        //     // print(
        //     //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");
        //     break;

        //   case 4:
        //     // 4 is the favourest
        //     activeDrawerPage = 5;

        //     // print(
        //     //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");
        //     break;

        //   case 5:
        //     // 4 is the personal
        //     activeDrawerPage = 8;
        //     // print(
        //     //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");

        //     break;
        // }

        // bottomNavBarTapded(newPageNumber) {
        // activePageNumber == newPageNumber;
        // activePageNumber == BottomNavBarTapdedEvent. ;
        // }

        bottomNavBarTapded(newPageNumber: event.tappdedPageNumber);

        // activePageNumber = BottomNavBarTapdedEvent(tappdedPageNumber: tappdedPageNumber)

        emit(BottomNavSucsessState());
        // emit(HomeDrawerLoadedState());
        // print("home drawereererererer Loaded state $activeDrawerPage");
      }

      //
      //
      //
    });
  }
}
