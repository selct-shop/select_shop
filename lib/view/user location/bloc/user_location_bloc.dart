import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/Location%20models/getAllEmaritesModle.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  List<String> listOfEmirtatesNames = [];
  List<AddressCityModle> listOfEmirtates = [];
  UserLocationBloc() : super(UserLocationInitialState()) {
    on<UserLocationEvent>((event, emit) async {
      // TODO: implement event handler

      // #### get all emirates #### //
      if (event is GetAllEmirateEvent) {
        emit(LoadingAllEmiratesState());
        print("emirateees gggggggeeeet   allll emirates");
        try {
          Response<dynamic> getAllEmiratesResponse =
              await DioHelper.getAllEmirates();
          if (getAllEmiratesResponse.statusCode!.isSuccessfulHttpStatusCode) {
            // listOfEmirtatesNames.clear();
            listOfEmirtates.clear();
            GetAllEmiratesModle getAllEmiratesModle =
                GetAllEmiratesModle.fromJson(getAllEmiratesResponse.data);
            List<AddressCityModle> emiratesList =
                getAllEmiratesModle.result.addressCities;
              //  listOfEmirtates =
              //   getAllEmiratesModle.result.addressCities;
            for (var item in emiratesList) {
              listOfEmirtatesNames.add(item.nameEn);
              print("emirateees successsssssssssss");
            }
            emit(AllEmiratesLoadedState());
          } else {
            emit(GetAllEmiratesErrorState(
              errorMessage: getAllEmiratesResponse.statusCode.toString() +
                  getAllEmiratesResponse.statusMessage.toString(),
            ));
          }
        } catch (e) {
          throw Exception(e);
        }
      }
    });
  }
}
