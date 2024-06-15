import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/view/track%20order/models/orders_models.dart';

part 'track_order_event.dart';
part 'track_order_state.dart';

class TrackOrderBloc extends Bloc<TrackOrderEvent, TrackOrderState> {
  
  TrackOrderBloc() : super(TrackOrderInitialState()) {

    List<Order> ordersList = [];
    on<TrackOrderEvent>((event, emit) async{
      // TODO: implement event handler

      if (event is TrackOrderInitalEvent ){
        emit(TrackOrderLoadingState()); 

          try {
            Response ordersResponse =
                await DioHelper.getHomeMainCategories();

            if (ordersResponse.statusCode!.isSuccessfulHttpStatusCode) {
              OrdersModel ordersModel =
                  OrdersModel.fromJson(ordersResponse.data);
              // List<MainCategoriesResult?>? mainCategoResutList =
              //     getMainCategoriesModle.result;
              // if (mainCategoResutList != null) {
              //   categoresListForHomeScreen = mainCategoResutList;
              //   emit(HomeGetHomeCatiegorsucseesState());
              // } else {
              //   emit(HomeGetHomeCatiegorErrorState(
              //       errorMessage:
              //           "${ordersResponse.statusCode} \n ${ordersResponse.statusMessage}"));
              // }
ordersList.clear();
              ordersList = ordersModel.result.orders;
              emit(TrackOrderSucsessState(ordersList: ordersList));
            } else {
              emit(TrackOrderErrorState(
                  errorMessage: ordersResponse.statusMessage ??
                      "unknown Error"));
            }
          } catch (exception) {
            
            
              emit(TrackOrderErrorState(
                  errorMessage:
                      "unknown Error"));
          }
        




      }
    });
  }
}
