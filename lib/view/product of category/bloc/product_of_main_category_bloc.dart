import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/sub%20categories%20model/sub_categories_model.dart';

part 'product_of_main_category_event.dart';
part 'product_of_main_category_state.dart';

class ProductOfMainCategoryBloc
    extends Bloc<ProductOfCategoryEvent, ProductsOfMainCategoryState> {
  List<SubCategoriesResult> subCategoriesList = [];
   bool loadingSubCategories = true;
   bool loadingTheProducts = true;
  ProductOfMainCategoryBloc() : super(ProductsOfMainCategoryInitialState()) {
    on<ProductOfCategoryEvent>((event, emit) async {
      // TODO: implement event handler

      ///
      ///
      ///

// #### #### //
// #### inital of the screen event #### //
      if (event is ProductsOfCategoryInitalEvent) {
        // initalization code

        // emit loading for the hole screen
        emit(ProductsOfMainCategoryLoadingState());

        // get the subcategories
        add(GetTheSubCategoryOfTheMainCategoryEvent(
            theMainCategoryID: event.theMainCategoryID));

        // get the subcategories
        //  add(GetAllTheProductsOfTheMainCategoryEvent( theMainCategoryID: event.theMainCategoryID ));

        // emit loaded sucsses state
        print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");
        emit(ProductsOfMainCategoryLoadedState());
        print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");
      }

      ///
      ///
      ///

// #### #### //
// #### get all subCategorys of the main category #### //
      if (event is GetTheSubCategoryOfTheMainCategoryEvent) {
// emit loading state
        // emit(ProductsOfMainCategoryGetSubCategoriesLoadingState());

        loadingSubCategories = true;
        Response<dynamic> response =
            await DioHelper.getAllSubCategoryOfMainCategory(
                mainCategoryID: event.theMainCategoryID);

        if (response.statusCode == 200) {
          print("geeeeeet allllllll sub cate donnnnnnnnnnnnnnnnnnnnne");
          GetAllSubCategoriesOfMainCateIdModle subCategoriesOfMainCateIdModle =
              GetAllSubCategoriesOfMainCateIdModle.fromJson(response.data);

          // clear the cached data and add new one
          subCategoriesList.clear();
          subCategoriesList = subCategoriesOfMainCateIdModle.result;

          // emit loaded or success state
          // emit(ProductsOfMainCategoryGetSubCategoriesSuccessState());
          loadingSubCategories = false; 

          // emit(ProductsOfMainCategoryLoadedState());
        } else {
          // emit(GetThema)
        }
      }

      ///
      ///
      ///
      ///
      ///
    });
  }
}
