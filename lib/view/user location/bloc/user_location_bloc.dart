import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/Location%20models/getAllEmaritesModle.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  List<String > listOfEmirtatesNames = [ ] ;
  UserLocationBloc() : super(UserLocationInitialState()){
    on<UserLocationEvent>((event, emit) async {
      // TODO: implement event handler

      // #### get all emirates #### //
if(event is GetAllEmirateEvent){
  emit( LoadingAllEmiratesState ()); 
try{
  Response<dynamic> getAllEmiratesResponse =
await DioHelper.getAllEmirates();
if ( getAllEmiratesResponse.statusCode == 200){

  GetAllEmiratesModle getAllEmiratesModle =
GetAllEmiratesModle.fromJson(getAllEmiratesResponse.data);
// List<EmiratesResult> listOfEmiratesResult = getAllEmiratesModle.result ;

listOfEmirtatesNames.clear();
//  listOfEmirtatesNames.addAll(getAllEmiratesModle.result.addressCities.);

// listOfEmirtatesNames.add(getAllEmiratesModle.result.addressCities)

// listOfEmirtatesNames = getAllEmiratesModle.result.

// for ( var emirateName in getAllEmiratesModle.result ){

// }

// for ( var emirateName in listOfEmiratesResult ) {
//   listOfEmirtatesNames.add(emirateName)
// }



emit(AllEmiratesStateLoadedState());
} else {
  emit( GetAllEmiratesErrorState(errorMessage: getAllEmiratesResponse.statusCode.toString() + getAllEmiratesResponse.statusMessage.toString(), 
  ));
}
}catch(e) {
  throw Exception(e);
}

}

    });
  }
}
