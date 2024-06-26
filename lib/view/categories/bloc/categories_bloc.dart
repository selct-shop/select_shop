import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/categories/categories_modle.dart';
import 'package:select_shop/models/categories/get_main_categories_deatails.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  // List<CategoriesResult?> categoriesLisssst = [];

  List<MainCategoriesResult?>?  categoriesLisssst = [];

  CategoriesBloc() : super(CategoriesInitialState()) {
    on<CategoriesEvent>((event, emit) async {
      // TODO: implement event handler

      ///
      ///
      // ####  get categories #### //
      // if (event is GetCategoriesEvent) {
      //   emit(CategoriesLoadingState());

      //   try {
      //     Response getCateResponse = await DioHelper.getCategories();

      //     if (getCateResponse.statusCode == 200) {
      //       CategoriesModle categoriesModle =
      //           CategoriesModle.fromJson(getCateResponse.data);
      //       List<CategoriesResult> cateeegoriss =
      //           categoriesModle.categoriesResult;
      //       if (cateeegoriss != null) {
      //         categoriesLisssst = cateeegoriss;
      //         emit(CategoriesSuccsessState());
      //       } else {
      //         emit(CategoriesErrorState(
      //             errorMessage:
      //                 "${getCateResponse.statusCode} \n ${getCateResponse.statusMessage}"));
      //       }
      //       emit(CategoriesSuccsessState());
      //     } else {
      //       emit(CategoriesErrorState(
      //           errorMessage:
      //               getCateResponse.statusMessage ?? "unknown Error"));
      //     }
      //   } catch (exception) {
      //     emit(CategoriesErrorState(errorMessage: exception.toString()));
      //   }

      //   ///
      //   ///   get categoris
      // }




      
      ///
      ///
      // #### get categories version 2 #### //
      if (event is GetMainCategoriesEvent) {
        emit(CategoriesLoadingState());

        try {
          Response getCateResponse = await DioHelper.getHomeMainCategories();

          if (getCateResponse.statusCode!.isSuccessfulHttpStatusCode) {
            GetMainCategoriesModle mainCategoriesModle =
                GetMainCategoriesModle.fromJson(getCateResponse.data);
            List<MainCategoriesResult?>? cateeegoriss =
                mainCategoriesModle.result;
            if (cateeegoriss != null) {
              categoriesLisssst = cateeegoriss;
              emit(CategoriesSuccsessState());
            } else {
              emit(CategoriesErrorState(
                  errorMessage:
                      "${getCateResponse.statusCode} \n ${getCateResponse.statusMessage}"));
            }
            emit(CategoriesSuccsessState());
          } else {
            emit(CategoriesErrorState(
                errorMessage:
                    getCateResponse.statusMessage ?? "unknown Error"));
          }
        } catch (exception) {
          emit(CategoriesErrorState(errorMessage: exception.toString()));
        }

        ///
        ///   get categoris
      }
    });
  }
}
