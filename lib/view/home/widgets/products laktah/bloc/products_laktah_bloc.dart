import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:select_shop/models/the%20product/the_product_modle.dart';

part 'products_laktah_event.dart';
part 'products_laktah_state.dart';

class ProductsLaktahBloc extends Bloc<ProductsLaktahEvent, ProductsLaktahState> {


  // bool loadingNewProducts = true;

  // List<CollectionProduct> newCollctionProductsList = [];



  ProductsLaktahBloc() : super(ProductsLaktahInitalState())  {
    on<ProductsLaktahInitalEvent>((event, emit) async  {
      // TODO: implement event handler



// #### get the new products #### //
      if (event is ProductsLaktahInitalEvent) {
        emit(ProductsLaktahLoadingState());
        // loadingNewProducts = true;
        // get all the categories
        try {
          Response getHomeNewProducts =
              await DioHelper.getNewProductsHome(collection: "lakta");
          if (getHomeNewProducts.statusCode!.isSuccessfulHttpStatusCode) {
            // print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
            // print("${getHomeNewProducts.data}");
            TheCollectionModel theCollectionModel =
                TheCollectionModel.fromJson(getHomeNewProducts.data);
            // newCollctionProductsList = getCollectionModel.result.products;
            if (theCollectionModel.result.products.isEmpty) {
              // categoresListForHomeScreen = mainCategoResutList;
              // loadingNewProducts = false;
              emit(ProductsLaktahEmptyState(
                newProductCollectionList: theCollectionModel.result.products,
                    theCollectionModel: theCollectionModel,

              ));
            }

            if (theCollectionModel.result.products.isNotEmpty) {
              // categoresListForHomeScreen = mainCategoResutList;
              // loadingNewProducts = false;
              emit(ProductsLaktahSucsessState(
                newProductCollectionList: theCollectionModel.result.products,
                    theCollectionModel: theCollectionModel,

              ));
            } else {
              emit(ProductsLaktahErrorState(
                  errorMessage:
                      "${getHomeNewProducts.statusCode} \n ${getHomeNewProducts.statusMessage}"));
            }
            // emit(HomeGetHomeCatiegorsucseesState());
          } else {
            emit(ProductsLaktahErrorState(
                errorMessage:
                    "${getHomeNewProducts.statusCode} \n ${getHomeNewProducts.statusMessage}"));
          }
        } catch (exception) {
          emit(ProductsLaktahErrorState(errorMessage: "$exception"));
        }
      }
    });
  }
}
