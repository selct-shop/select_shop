import 'package:dio/dio.dart';
import 'package:special_line_rider/shared/constants.dart';

class DioHelper {
  static String baseUrl = 'https://crm.specialline.info/api/';
  // 'https://orderhere.info/api/';
  //'http://10.0.2.2:8000/api/'; //   // //http://10.0.3.2:8000/api/;

  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    // String? token,
  }) async {
    print(url);
    dio!.options.headers = {
      //'lang': lang,
      'Authorization': 'Bearer $token' // ?? CacheHelper.getData(key: "token"),
      //'Content-Type': 'application/json',
    };
    print(dio!.options.headers);
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required dynamic data,

    // String lang = "en",
    //String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      //'Accept': 'application/json',
    };
    // print('url->$url\n data->$data');
    try {
      return await dio!.post(
        url,
        queryParameters: queryParameters,
        data: data,
      );
    } catch (e) {
      print('err: $e');
      return Response(requestOptions: RequestOptions());
    }
  }

  // static Future<Response> sendNotificatoin({
  //   //required String url,
  //   //Map<String, dynamic>? queryParameters,
  //   required Map<String, dynamic> data,
  //   // String lang = "en",
  //   //String? token,
  // }) async {
  //   dio!.options.headers = {
  //     // 'lang': lang,
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'key=AAAAy3Sqo9E:APA91bFbbLLRvru8cqq7u4FfMJ55XHIJpVgbACWMk0gdaZ1vgHt4jYTtvAEsxuQ12ZrqWEBblteCb5DmoQsPe3y3rCfZEVddHiqkGLWkoVD-4G30NHCHl-Djb-GklIQmx45n_9d5htOI',
  //   };
  //   print('data => $data');
  //   // print('url->$url\n data->$data');
  //   return await dio!.post(
  //     'https://fcm.googleapis.com/fcm/send',
  //     //queryParameters: queryParameters,
  //     data: data,
  //   );
  // }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required dynamic data,
    String lang = "en",
    // String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    print('data ${data}');
    print('token ${token}');
    return await dio!.put(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String lang = "en",
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await dio!.delete(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }
}
