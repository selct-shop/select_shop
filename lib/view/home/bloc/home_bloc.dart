import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_status/http_status.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/categories/categories_modle.dart';
import 'package:select_shop/models/categories/get_main_categories_deatails.dart';
import 'package:select_shop/models/collection/get_collection_modle.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int activePageNumber = 1;
  int activeDrawerPage = 1;
  int currentCarouselSliderIndex = 0;
  List<MainCategoriesResult?> categoresListForHomeScreen = [];

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

    // print("DDDDDDDDdrrrrrrrrrrrrrrrwer$activeDrawerPage");
  }

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(
      (event, emit) async {
        // TODO: implement event handler

        // inital events
        // if (event is HomeInitialState) {
        //   add(HomeGetHomeCategoEvent());
        // }

        if (event is HomeGetHomeCategoEvent) {
          emit(HomeGetHomeCatiegorLoadingState());
          // get all the categories
          try {
            Response getHomeMainCateResponse =
                await DioHelper.getHomeMainCategories();

            if (getHomeMainCateResponse.statusCode == 200) {
              GetMainCategoriesModle getMainCategoriesModle =
                  GetMainCategoriesModle.fromJson(getHomeMainCateResponse.data);
              List<MainCategoriesResult?>? mainCategoResutList =
                  getMainCategoriesModle.result;
              if (mainCategoResutList != null) {
                categoresListForHomeScreen = mainCategoResutList;
                emit(HomeGetHomeCatiegorsucseesState());
              } else {
                emit(HomeGetHomeCatiegorErrorState(
                    errorMessage:
                        "${getHomeMainCateResponse.statusCode} \n ${getHomeMainCateResponse.statusMessage}"));
              }
              emit(HomeGetHomeCatiegorsucseesState());
            } else {
              emit(HomeGetHomeCatiegorErrorState(
                  errorMessage: getHomeMainCateResponse.statusMessage ??
                      "unknown Error"));
            }
          } catch (exception) {
            emit(HomeGetHomeCatiegorErrorState(
                errorMessage: exception.toString()));
          }
        }

        if (event is BottomNavBarTapdedEvent) {
          emit(HomeLoadingState());

          switch (event.tappdedPageNumber) {
            case 1:
              // 1 is the home
              activeDrawerPage = 1;
              // print(
              //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");

              break;

            // case 2:
            //   // 2 is the categoryes
            //   activeDrawerPage = 5;

            //   // print(
            //   //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");
            //   break;

            case 4:
              // 4 is the favourest
              activeDrawerPage = 5;

              // print(
              //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");
              break;

            // case 3:
            //   // 3 is the favourest
            //   activeDrawerPage = 5;

            //   // print(
            //   //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");
            //   break;

            case 5:
              // 4 is the personal
              activeDrawerPage = 8;
              // print(
              //     "hoooooooooooooooooooooooooooooome nav bar eveeeeeeeeeeeeeeeeeeeeeeeent $activeDrawerPage");

              break;
          }

          // bottomNavBarTapded(newPageNumber) {
          // activePageNumber == newPageNumber;
          // activePageNumber == BottomNavBarTapdedEvent. ;
          // }

          bottomNavBarTapded(newPageNumber: event.tappdedPageNumber);

          // activePageNumber = BottomNavBarTapdedEvent(tappdedPageNumber: tappdedPageNumber)

          emit(HomeLoadedState());
          emit(HomeDrawerLoadedState());
          print("home drawereererererer Loaded state $activeDrawerPage");
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
