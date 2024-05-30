import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:select_shop/models/the%20product/the_product_modle.dart';

part 'products_new_event.dart';
part 'products_new_state.dart';

class GetNewProductsBloc extends Bloc<GetNewProductsEvent, GetNewProductsState> {


  // bool loadingNewProducts = true;

  // List<CollectionProduct> newCollctionProductsList = [];



  GetNewProductsBloc() : super(GetNewProductsInitial())  {
    on<GetNewProductsEvent>((event, emit) async  {
      // TODO: implement event handler



      
// #### get the new products #### //
        if (event is HomeGetHomeNewProductsInitalEvent) {
          emit(GetNewProductsLoadingState());
          // loadingNewProducts = true;
          // get all the categories
          try {
            Response getHomeNewProducts =
                await DioHelper.getNewProductsHome(collection: "new");
            if (getHomeNewProducts.statusCode != null) {
              if (getHomeNewProducts.statusCode!.isSuccessfulHttpStatusCode) {
                print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
                print("${getHomeNewProducts.data}");
                TheCollectionModel theCollectionModel =
                    TheCollectionModel.fromJson(getHomeNewProducts.data);
                // newCollctionProductsList = getCollectionModel.result.products;
                if (theCollectionModel.result.products.isEmpty) {
                  // categoresListForHomeScreen = mainCategoResutList;
                  // loadingNewProducts = false;
                  emit(GetNewProductEmptyState(
                    newProductCollectionList:
                        theCollectionModel.result.products,
                  ));
                }

                if (theCollectionModel.result.products.isNotEmpty) {
                  // categoresListForHomeScreen = mainCategoResutList;
                  // loadingNewProducts = false;
                  emit(GetNewProductLoadedState(
                    newProductCollectionList:
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
                // emit(HomeGetHomeCatiegorErrorState(
                //     errorMessage: getHomeMainCateResponse.statusMessage ??
                //         "unknown Error"));
              }
            }
          } catch (exception) {
            emit(GetNewProductErrorState(
                errorMessage: exception.toString()));
          }
        }
    });
  }
}
