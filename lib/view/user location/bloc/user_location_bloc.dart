import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/Location%20models/getAllEmaritesModle.dart';
import 'package:select_shop/view/user%20location/models/local_location_model.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  List<String> listOfEmirtatesNames = [];
  List<AddressCityModle> listOfEmirtates = [];
  List<LocalLocationModel> localLocationsList = [];
  // final _myBox = Hive.box(AppConstants.hiveBox);

  Future<void> addLocation(LocalLocationModel location) async {
    var box = await Hive.openBox<LocalLocationModel>(AppConstants.hiveBox);
    await box.add(location);
  }

  Future<List<LocalLocationModel>> getAllLocations() async {
    var box = await Hive.openBox<LocalLocationModel>(AppConstants.hiveBox);
    return box.values.toList();
    // return _myBox.values.toList();
  }

  UserLocationBloc() : super(UserLocationInitialState()) {
    on<UserLocationEvent>((event, emit) async {
      // TODO: implement event handler

      // #### get all emirates #### //
      if (event is GetAllEmirateEvent) {
        emit(LoadingAllEmiratesState());
        // print("emirateees gggggggeeeet   allll emirates");
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

      // #### get all local locations #### //
      // if (event is GetLocalLocationsEvent) {
      //   // emit(LoadingAllEmiratesState());
      //   // print("emirateees gggggggeeeet   allll emirates");

      //   //  List<LocalLocationModel> locaList = CacheHelper.getUserLocations() as List<LocalLocationModel>;

      //   //  print("99999999999999999999999999999999999999$locaList");
      // }

      // writeUserLocations (LocalLocationModel localLocationModel){
      //   _myBox.add(  localLocationModel);
      // }
      // readUserLocations(){
      //   _myBox.get(key)
      // }
      // deleteUserLocation(){}

      // #### add user location #### //
      if (event is AddUserLocationEvent) {
        emit(UserLocationLoadingState());
        // print("emirateees gggggggeeeet   allll emirates");

        //  List<LocalLocationModel> locaList = CacheHelper.getUserLocations() as List<LocalLocationModel>;

        //  print("99999999999999999999999999999999999999$locaList");

        await addLocation(event.localLocationModel);
        emit(LoadingAllEmiratesState());
      }

      // #### get user location #### //
      if (event is GetLocalLocationsEvent) {
        // emit(UserLocationLoadingState());
        // print("emirateees gggggggeeeet   allll emirates");

        //  List<LocalLocationModel> locaList = CacheHelper.getUserLocations() as List<LocalLocationModel>;

        //  print("99999999999999999999999999999999999999$locaList");

        print(await getAllLocations());
        // emit(LoadingAllEmiratesState());
      }
    });
  }
}
