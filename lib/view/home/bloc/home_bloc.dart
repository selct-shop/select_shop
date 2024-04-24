import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int activePageNumber = 1;
  int currentCarouselSliderIndex = 0;
  // Locale initalLang =
  // CacheHelper.getData(key: 'lang') == 'en' ? Locale('en') : Locale('ar');

  onCarouselSliderPageChanged({required int index}) {
    currentCarouselSliderIndex = index;
  }

  bottomNavBarTapded({required int newPageNumber}) {
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

        //       if (event is SetLanguageEvent) {
        //    Locale(event.languageCode);
        // }
      },
    );
  }
}
