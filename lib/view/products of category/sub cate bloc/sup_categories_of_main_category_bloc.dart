import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/sub%20categories%20model/sub_categories_model.dart';

part 'sup_categories_of_main_category_event.dart';
part 'sup_categories_of_main_category_state.dart';

class SupCategoriesOfMainCategoryBloc extends Bloc<SupCategoriesOfMainCategoryEvent, SupCategoriesOfMainCategoryState> {
  SupCategoriesOfMainCategoryBloc() : super(SupCategoriesOfMainCategoryInitialState()) {
    on<SupCategoriesOfMainCategoryEvent>((event, emit) async{
      // TODO: implement event handler


      if(event is SubCategoriesOfMainCateInitalEvent ){

        emit(SupCategoriesOfMainCategoryLoadingState()); 

         DioHelper.getAllSubCategoryOfMainCategory(mainCategoryID: event.mainCatID); 


           try {
            Response getSubCate =
                await DioHelper.getAllSubCategoryOfMainCategory(mainCategoryID:event.mainCatID);
          
              if (getSubCate.statusCode!.isSuccessfulHttpStatusCode) {
                // print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
                // print("${getHomeNewProducts.data}");
                SubCategoriesOfMainCategoresModle subCategoriesOfMainCategoresModle =
                    SubCategoriesOfMainCategoresModle.fromJson(getSubCate.data);
                // newCollctionProductsList = getCollectionModel.result.products;
                if (subCategoriesOfMainCategoresModle.result.isEmpty) {
                  // categoresListForHomeScreen = mainCategoResutList;
                  // loadingNewProducts = false;
                  emit(SupCategoriesOfMainCategoryEmptyState(
                    subCategoriesOfMainCategoresModle: subCategoriesOfMainCategoresModle
                  ));
                }

                if (subCategoriesOfMainCategoresModle.result.isNotEmpty) {
                  // categoresListForHomeScreen = mainCategoResutList;
                  // loadingNewProducts = false;
                  emit(SupCategoriesOfMainCategorySucsessState(
                    
                    subCategoriesOfMainCategoresModle: subCategoriesOfMainCategoresModle
                  ));
                }
                // else {
                //   emit(HomeGetHomeCatiegorErrorState(
                //       errorMessage:
                //           "${getHomeMainCateResponse.statusCode} \n ${getHomeMainCateResponse.statusMessage}"));
                // }
                // emit(HomeGetHomeCatiegorsucseesState());
              } else {
                emit(SupCategoriesOfMainCategoryErrorState(
                    errorMessage: "${getSubCate.statusCode } \n ${getSubCate.statusMessage} "??
                        "unknown Error"));
              }
            
          } catch (exception) {
            
            
                emit(SupCategoriesOfMainCategoryErrorState(
                    errorMessage: "$exception "??
                        "unknown Error"));
          }

      }
    });
  }
}
