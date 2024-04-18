import 'package:dio/dio.dart';

class DioHelper {
  // static String baseUrl = 'https://crm.specialline.info/api/';
  static String baseUrl = 'http://localhost:3000';
  static const String logInUrl = 'http://localhost:3000/customer/signin';

  // 'https://orderhere.info/api/';
  //'http://10.0.2.2:8000/api/'; //   // //http://10.0.3.2:8000/api/;

  static Dio? _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    ));
  }

  static Future<Response> login(
      {required String phoneNumber, required String password}) async {
    try {
      final response = await _dio!.post(
        logInUrl,
        // data: {
        //   "phoneNumber": phoneNumber,
        //   "password": password,
        //   "rememberMe": true,
        // },

        data: {
          "phoneNumber": "971542287649",
          "password": "19961996",
          "rememberMe": true
        },
      );
      if (response.statusCode == 200) {
        print(
            'auuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuth: $response');
      }

      // http://localhost:3000/customer/signin,data:{"phoneNumber": "559895231","password": "12345","rememberMe": true}

      print('ressssssssssssssssssssssssssssspons: ${response.statusCode}');

      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    // String? token,
  }) async {
    // print(url);
    _dio!.options.headers = {
      //'lang': lang,

      // #### //
      // 'Authorization': 'Bearer $token'

      // #### //

      // ?? CacheHelper.getData(key: "token"),
      //'Content-Type': 'application/json',
    };
    print(_dio!.options.headers);
    return await _dio!.get(
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
    _dio!.options.headers = {
      // #### //

      // 'Authorization': 'Bearer $token',
      // #### //

      //'Accept': 'application/json',
    };
    // print('url->$url\n data->$data');
    try {
      return await _dio!.post(
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
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',

      // #### //

      // 'Authorization': 'Bearer $token'

      // #### //
    };
    print('data ${data}');

    // #### //

    // print('token ${token}');

    // #### //

    return await _dio!.put(
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
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await _dio!.delete(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }
}