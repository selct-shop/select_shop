import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:select_shop/models/the%20product/the_product_modle.dart';

part 'products_new_event.dart';
part 'products_new_state.dart';

class ProductsNewBloc extends Bloc<ProductsNewEvent, ProductsNewState> {
  // bool loadingNewProducts = true;

  // List<CollectionProduct> newCollctionProductsList = [];

  ProductsNewBloc() : super(ProductsNewInitalState()) {
    on<ProductsNewEvent>((event, emit) async {
      // TODO: implement event handler

// #### get the new products #### //
      if (event is ProductsNewInitalEvent) {
        emit(ProductsNewLoadingState());
        // loadingNewProducts = true;
        // get all the categories

        try {
          Response getHomeNewProducts =
              await DioHelper.getNewProductsHome(collection: "new");
          if (getHomeNewProducts.statusCode!.isSuccessfulHttpStatusCode) {
            // print("succcccccccccccccccccccccccccccccccccccccccccccccccc");

            // print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
            // print("${getHomeNewProducts.data}");
            TheCollectionModel theCollectionModel =
                TheCollectionModel.fromJson(getHomeNewProducts.data);
            // newCollctionProductsList = getCollectionModel.result.products;
            if (theCollectionModel.result.products.isEmpty) {
              // categoresListForHomeScreen = mainCategoResutList;
              // loadingNewProducts = false;
              emit(ProductsNewEmptyState(
                newProductCollectionList: theCollectionModel.result.products,

                    theCollectionModel: theCollectionModel,

              ));
            }

            if (theCollectionModel.result.products.isNotEmpty) {
              // categoresListForHomeScreen = mainCategoResutList;
              // loadingNewProducts = false;
              // print("succcccccccccccccccccccccccccccccccccccccccccccccccc");
              emit(ProductsNewSucsessState(
                newProductCollectionList: theCollectionModel.result.products,

                    theCollectionModel: theCollectionModel,

              ));
            } else {
              emit(ProductsNewErrorState(
                  errorMessage:
                      "${getHomeNewProducts.statusCode} \n ${getHomeNewProducts.statusMessage}"));
            }
            // emit(HomeGetHomeCatiegorsucseesState());
          } else {
            emit(ProductsNewErrorState(
                errorMessage:
                    "${getHomeNewProducts.statusCode} \n ${getHomeNewProducts.statusMessage}"));
          }
        } catch (exception) {
          emit(ProductsNewErrorState(errorMessage: exception.toString()));
        }
      }
    });
  }
}
