import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/products%20of%20category%20models/products_of_category_model.dart';
import 'package:select_shop/models/sub%20categories%20model/sub_categories_model.dart';
import 'package:http_status/http_status.dart';

part 'product_of_main_category_event.dart';
part 'product_of_main_category_state.dart';

class ProductOfMainCategoryBloc
    extends Bloc<ProductOfCategoryEvent, ProductsOfMainCategoryState> {
  List<SubCategoriesResult> subCategoriesList = [];
  // list of the products of the subCategory or the main category
  List<CategoryProduct?> productsOfACategoryResultList = [];
  bool loadingSubCategoriesState = true;
  bool loadingTheProductsState = true;

  // #### #### //
  // get all subCategory function //

  Future<bool> getTheSubCategoryOfTheMainCategoryFunc(
      {required final int theMainCategoryID}) async {
    loadingSubCategoriesState = true;
    Response<dynamic> response =
        await DioHelper.getAllSubCategoryOfMainCategory(
            mainCategoryID: theMainCategoryID);

if (response.statusCode!.isSuccessfulHttpStatusCode) {
  // final httpStatus = HttpStatus.fromCode(response!.statusCode);

  // return {
  //   'statusCode': res.statusCode,
  //   'httpStatus': httpStatus,
  //   'data': res.body
  // };


      print("geeeeeet allllllll sub cate donnnnnnnnnnnnnnnnnnnnne");
      GetAllSubCategoriesOfMainCateIdModle subCategoriesOfMainCateIdModle =
          GetAllSubCategoriesOfMainCateIdModle.fromJson(response.data);

      // clear the cached data and add new one
      subCategoriesList.clear();
      subCategoriesList = subCategoriesOfMainCateIdModle.result;

      // emit loaded or success state
      // emit(ProductsOfMainCategoryGetSubCategoriesSuccessState());
      loadingSubCategoriesState = false;
      // emit(ProductsOfMainCategoryLoadedState());
      return true;
}


     else {
      return false;
    }
  }

// #### #### //
// #### get all products of the main category #### //

  Future<bool> getAllProductsOfACategoryFunc(
      {required final int theMainCategoryID}) async {
    loadingTheProductsState = true;
    Response<dynamic> response = await DioHelper.getAllProductsOfMainCategory(
        mainCategoryID: theMainCategoryID);

    if (
      // response.statusCode == 200

      response.statusCode!.isSuccessfulHttpStatusCode
    ) {
      print("geeeeeet allllllll products donnnnnnnnnnnnnnnnnnnnne");
      GetAllProductsOfACategoryModel getAllProductsOfACategoryModel =
          GetAllProductsOfACategoryModel.fromJson(response.data);

      // clear the cached data and add new one
      productsOfACategoryResultList.clear();
      productsOfACategoryResultList =
          getAllProductsOfACategoryModel.result.categoryProducts;

      // emit loaded or success state
      // emit(ProductsOfMainCategoryGetSubCategoriesSuccessState());
      loadingTheProductsState = false;
      // emit(ProductsOfMainCategoryLoadedState());
      return true;
    } else {
      return false;
    }

    ///
    ///
    ///
    ///
    ///
  }

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
        // add(GetTheSubCategoryOfTheMainCategoryEvent(
        //     theMainCategoryID: event.theMainCategoryID));
        // getTheSubCategoryOfTheMainCategoryFunc(
        //     theMainCategoryID: event.theMainCategoryID);

        // get the subcategories
        //  add(GetAllTheProductsOfTheMainCategoryEvent( theMainCategoryID: event.theMainCategoryID ));

        // getAllProductsOfACategoryFunc(
        //     theMainCategoryID: event.theMainCategoryID);

        bool theSubCat = await getTheSubCategoryOfTheMainCategoryFunc(
            theMainCategoryID: event.theMainCategoryID);
        bool theProductsOfMainCat = await getAllProductsOfACategoryFunc(
            theMainCategoryID: event.theMainCategoryID);

        if (theSubCat == true && theProductsOfMainCat == true) {
          // emit loaded sucsses state
          print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit Sucsess");
          emit(ProductsOfMainCategoryLoadedState());
          print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");
        } else {
          emit(ProductsOfMainCategoryErrorState());
        }

        //   if (await getTheSubCategoryOfTheMainCategoryFunc(
        //               theMainCategoryID: event.theMainCategoryID) ==
        //           true &&
        //       await getAllProductsOfACategoryFunc(
        //               theMainCategoryID: event.theMainCategoryID) ==
        //           true) {
        //     // emit loaded sucsses state
        //     print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");
        //     emit(ProductsOfMainCategoryLoadedState());
        //     print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");
        //   } else {
        //     emit(ProductsOfMainCategoryErrorState());
        //   }

        //   // // emit loaded sucsses state
        //   // print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");
        //   // emit(ProductsOfMainCategoryLoadedState());
        //   // print("emmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmiiitititit");

        // emit(ProductsOfMainCategoryLoadedState());
      }

      ///
      ///
      ///

// #### #### //
// #### get all subCategorys of the main category #### //
      // if (event is GetTheSubCategoryOfTheMainCategoryEvent) {
// emit loading state
      // emit(ProductsOfMainCategoryGetSubCategoriesLoadingState());
// temp
      // loadingTheProductsState = false;

      //   } else {
      //     // emit(GetThema)
      //   }
      // }

      ///
      ///
      ///
      ///
      ///

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
      // #### #### //
// #### get all the proudcts of the main category #### //
//       if (event is GetAllTheProductsOfTheMainCategoryEvent) {
// // emit loading state
//         // emit(ProductsOfMainCategoryGetSubCategoriesLoadingState());

//         loadingTheProductsState  = true;
//         Response<dynamic> response =
//             await DioHelper.getAllProductsOfMainCategory(
//                 mainCategoryID: event.theMainCategoryID);

//         if (response.statusCode == 200) {
//           print("geeeeeet allllllll products donnnnnnnnnnnnnnnnnnnnne");
//           GetAllProductsOfACategoryModel getAllProductsOfACategoryModel =
//               GetAllProductsOfACategoryModel.fromJson(response.data);

//           // clear the cached data and add new one
//           productsOfACategoryResultList.clear();
//           productsOfACategoryResultList = getAllProductsOfACategoryModel.result.categoryProducts;

//           // emit loaded or success state
//           // emit(ProductsOfMainCategoryGetSubCategoriesSuccessState());
//           loadingTheProductsState = false;
//           emit(ProductsOfMainCategoryLoadedState());

//         } else {
//           // emit(GetThema)
//         }
//       }
    });

    // @override
    // void   onChange(change){
    //   }
  }
}




