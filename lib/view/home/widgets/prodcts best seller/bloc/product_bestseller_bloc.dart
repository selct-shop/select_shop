import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:select_shop/models/the%20product/the_product_modle.dart';

part 'products_bestseller_event.dart';
part 'products_bestseller_state.dart';

class ProductBestsellerBloc extends Bloc<ProductsBestSellerInitalEvent, ProductsBestsellerState> {


  // bool loadingNewProducts = true;

  // List<CollectionProduct> newCollctionProductsList = [];



  ProductBestsellerBloc() : super(ProductsBestSellerInitalState())  {
    on<ProductsBestSellerInitalEvent>((event, emit) async  {
      // TODO: implement event handler



      
// #### get the new products #### //
        if (event is ProductsBestSellerInitalEvent) {
          emit(ProductsBestSellerLoadingState());
          // loadingNewProducts = true;
          // get all the categories
          try {
            Response getHomeNewProducts =
                await DioHelper.getNewProductsHome(collection: "bestSeller");
          
              if (getHomeNewProducts.statusCode!.isSuccessfulHttpStatusCode) {
                // print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
                // print("${getHomeNewProducts.data}");
                TheCollectionModel theCollectionModel =
                    TheCollectionModel.fromJson(getHomeNewProducts.data);
                // newCollctionProductsList = getCollectionModel.result.products;
                if (theCollectionModel.result.products.isEmpty) {
                  // categoresListForHomeScreen = mainCategoResutList;
                  // loadingNewProducts = false;
                  emit(ProductsBestSellerEmptyState(
                    bestSellerCollectionProductList:
                    theCollectionModel.result.products
                    ,
                  ));
                }

                if (theCollectionModel.result.products.isNotEmpty) {
                  // categoresListForHomeScreen = mainCategoResutList;
                  // loadingNewProducts = false;
                  emit(ProductsBestSellerSucsessState(
                    bestSellerCollectionProductList:
                        theCollectionModel.result.products,
                  ));
                }
                // else {
                //   emit(HomeGetHomeCatiegorErrorState(
                //       errorMessage:
                //           "${getHomeMainCateResponse.statusCode} \n ${getHomeMainCateResponse.statusMessage}"));
                // }
                // emit(HomeGetHomeCatiegorsucseesState());
              } else {
                emit(ProductsBestSellerErrorState(
                    errorMessage: "${getHomeNewProducts.statusMessage } \n ${getHomeNewProducts.statusMessage} "??
                        "unknown Error"));
              }
            
          } catch (exception) {
            emit(ProductsBestSellerErrorState(
                errorMessage: exception.toString()));
          }
        }
    });
  }
}
