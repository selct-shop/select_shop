import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int activePageNumber = 1;
  int activeDrawerPage = 1;
  int currentCarouselSliderIndex = 0;
  // Locale initalLang =
  // CacheHelper.getData(key: 'lang') == 'en' ? Locale('en') : Locale('ar');

  onCarouselSliderPageChanged({required int index}) {
    currentCarouselSliderIndex = index;
  }

  bottomNavBarTapded({required int newPageNumber}) {
    activePageNumber = newPageNumber;
  }

  drawerTapded({required int newDrawerPage}) {
    activeDrawerPage = newDrawerPage;
    // switch (newDrawerPage) {
    //   case 1:
    //     // 1 in the drawer is ( my home )
    //     bottomNavBarTapded(newPageNumber: newDrawerPage);
    //     break;
    //   // case 6 :
    //   // // 6 in the drawer is ( my cart )
    //   // bottomNavBarTapded(newPageNumber: newDrawerPage);
    //   // break;
    //   case 5:
    //     // 5 in the drawer is ( my favouret ), and it's 3 in the bottoNavBAr
    //     bottomNavBarTapded(newPageNumber: 3);
    //     break;
    //   case 8:
    //     // 8 in the drawer is ( my setting, or personal )
    //     bottomNavBarTapded(newPageNumber: 4);
    //     break;
    // }

//
//

//     if (newDrawerPage == 1) {
//       // 1 in the drawer is ( my home )
//       bottomNavBarTapded(newPageNumber: 1);
//       activePageNumber = 1;
//     }

// // this section is canceled
//     // if (newDrawerPage == 5) {
//     //   //     // 5 in the drawer is ( my favouret ), and it's 3 in the bottoNavBAr
//     //   bottomNavBarTapded(newPageNumber: 3);
//     //   activePageNumber = 3;

//     // }

//     if (newDrawerPage == 6) {
//       // 6 in the drawer is ( my cart )
//       // bottomNavBarTapded(newPageNumber: 6);
//       // activePageNumber = 1;
//     }

//     if (newDrawerPage == 5) {
//       // 5 in the drawer is ( my favouret ), and it's 3 in the bottoNavBAr
//       bottomNavBarTapded(newPageNumber: 3);
//       activePageNumber = 3;
//     }

//     if (newDrawerPage == 8) {
//       // 8 in the drawer is ( my setting, or personal )
//       bottomNavBarTapded(newPageNumber: 4);
//       activePageNumber = 4;
//       print("seeeeeeeeeeeeeeeeeting");
//     }

    //
    //
    //

    // print("DDDDDDDDdrrrrrrrrrrrrrrrwer");
  }

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(
      (event, emit) {
        // TODO: implement event handler

        // print(
        //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent");

        if (event is BottomNavBarTapdedEvent) {
          emit(HomeLoadingState());

          switch (event.tappdedPageNumber) {
            case 1:
              // 1 is the home
              activeDrawerPage = 1;

            case 3:
              // 3 is the favourest
              activeDrawerPage = 5;

              print(
                  "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");

            case 4:
              // 4 is the personal
              activeDrawerPage = 8;
          }

          // bottomNavBarTapded(newPageNumber) {
          // activePageNumber == newPageNumber;
          // activePageNumber == BottomNavBarTapdedEvent. ;
          // }

          bottomNavBarTapded(newPageNumber: event.tappdedPageNumber);

          // activePageNumber = BottomNavBarTapdedEvent(tappdedPageNumber: tappdedPageNumber)

          emit(HomeLoadedState());
          // emit(HomeDrawerLoadedState());
        }

        //
        //
        //

        if (event is DrawerTapdedEvent) {
          emit(HomeLoadingState());
          emit(HomeDrawerLoadingState());

          activeDrawerPage = event.tappdedDrawerItemNumber;
          // print("ddddddddddddddddddddddddddddddrawer nav bar tapped  ");

          // bottomNavBarTapded(newPageNumber) {
          // activePageNumber == newPageNumber;
          // activePageNumber == BottomNavBarTapdedEvent. ;
          // }

          drawerTapded(newDrawerPage: event.tappdedDrawerItemNumber);

//
//
          // if (activeDrawerPage == 1) {
          //   // 1 in the drawer is ( my home )
          //   // bottomNavBarTapded(newPageNumber: 1);
          //   add(BottomNavBarTapdedEvent(tappdedPageNumber: 1));
          // }

          // if (activeDrawerPage == 5) {
          //   //     // 5 in the drawer is ( my favouret ), and it's 3 in the bottoNavBAr
          //   // bottomNavBarTapded(newPageNumber: 3);
          //   add(BottomNavBarTapdedEvent(tappdedPageNumber: 3));
          // }

          // if (activeDrawerPage == 6) {
          //   // 6 in the drawer is ( my cart )
          //   // bottomNavBarTapded(newPageNumber: 6);
          //   // add(BottomNavBarTapdedEvent(tappdedPageNumber: 3));
          // }

          // if (activeDrawerPage == 5) {
          //   // 5 in the drawer is ( my favouret ), and it's 3 in the bottoNavBAr
          //   bottomNavBarTapded(newPageNumber: 3);
          //   add(BottomNavBarTapdedEvent(tappdedPageNumber: 3));
          // }

          // if (activeDrawerPage == 8) {
          //   // 8 in the drawer is ( my setting, or personal )
          //   bottomNavBarTapded(newPageNumber: 4);
          //   add(BottomNavBarTapdedEvent(tappdedPageNumber: 4));
          // }

//
//

          // activePageNumber = BottomNavBarTapdedEvent(tappdedPageNumber: tappdedPageNumber)

          emit(HomeLoadedState());
          emit(HomeDrawerLoadedState());
        }

        //       if (event is SetLanguageEvent) {
        //    Locale(event.languageCode);
        // }
      },
    );
  }
}
