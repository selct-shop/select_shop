import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:select_shop/models/the%20product/the_product_modle.dart';
import 'package:select_shop/view/home/widgets/prodcts%20best%20seller/bloc/product_bestseller_bloc.dart';

part 'products_discounts_event.dart';
part 'products_discounts_state.dart';

class ProductsDiscountsBloc
    extends Bloc<ProductsDiscountsEvent, ProductsDiscountsState> {
  // bool loadingProductsDiscounts = true;

  // List<ProductCollection> newCollctionProductsList = [];

  ProductsDiscountsBloc() : super(ProductsDiscountInitalState()) {
    on<ProductsDiscountsEvent>((event, emit) async {
      // TODO: implement event handler

// #### get the disscounts products #### //
      if (event is ProductDiscountsInitalEven) {
        // print(
        // "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================initalll");

        emit(ProductsDiscountLoadingState());
        // loadingNewProducts = true;
        // get all the categories
        try {
          Response getDiscountProducts =
              await DioHelper.getNewProductsHome(collection: "descounted");
          // print(
          //     "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================discounted");

          if (getDiscountProducts.statusCode != null) {
            // print(
            //     "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================discounted${getDiscountProducts.statusCode}");
            if (getDiscountProducts.statusCode!.isSuccessfulHttpStatusCode) {
              print(
                  "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================discounted${getDiscountProducts.statusCode}");
              // print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
              // print("${getDiscountProducts.data}");
              TheCollectionModel theCollectionModel =
                  TheCollectionModel.fromJson(getDiscountProducts.data);
              // newCollctionProductsList = getCollectionModel.result.products;

              // print(
              //     "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================discounted${theCollectionModel.result.products}");
              if (theCollectionModel.result.products.isEmpty) {
                // categoresListForHomeScreen = mainCategoResutList;
                // loadingNewProducts = false;
                emit(ProductsDiscountEmptyState(
                  // newProductCollectionList: theCollectionModel.result.products,
                  newProductCollectionList: theCollectionModel.result.products, 

                    theCollectionModel: theCollectionModel,

                ));
              }

              // if (theCollectionModel.result.products.isNotEmpty) {
              if (theCollectionModel.result.products.isNotEmpty) {
                // print(
                //     "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================discounted${theCollectionModel.result.products}");
                // categoresListForHomeScreen = mainCategoResutList;
                // loadingNewProducts = false;
                // List<TheCollectionProduct> theProductModel =
                //     theCollectionModel.result.products;
                emit(ProductsDiscountSucsessState(
                  newProductCollectionList: theCollectionModel.result.products,
                  // newProductCollectionList: theProductModel,

                    theCollectionModel: theCollectionModel,

                ));

                // print(
                //     "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo========================discounted${theCollectionModel.result.products}");
              }
              // else {
              //   emit(HomeGetHomeCatiegorErrorState(
              //       errorMessage:
              //           "${getHomeMainCateResponse.statusCode} \n ${getHomeMainCateResponse.statusMessage}"));
              // }
              // emit(HomeGetHomeCatiegorsucseesState());
            } else {
              emit(ProductDiscountErrorState(
                  errorMessage:
                      getDiscountProducts.statusMessage ?? "unknown Error"));
            }
          }
        } catch (exception) {
          emit(ProductDiscountErrorState(errorMessage: exception.toString()));
        }
      }
    });
  }
}
