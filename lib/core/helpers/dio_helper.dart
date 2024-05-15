import 'package:dio/dio.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/main.dart';

class DioHelper {
  // static String baseUrl = 'https://crm.specialline.info/api/';
  // static String baseUrl = 'http://10.255.254.13:3000';
  // static String baseUrl = 'http://74.208.189.16:3000';

  static const String baseUrl = "https://a754-217-165-246-246.ngrok-free.app/";
  // static const String? userToken = globalUserToken ;

  static String logInUrl = '/customer/signin';
  static String signUpUrl = '/customer/signup';

  // the old categories url: and this used to get all categories
  static String categoriesAllUrl = '/category/all';

  // the new getHomeMainCategoriesUrl
  static String getHomeMainCategoriesUrl = '/category/main';

  // static const String logInUrl = 'http://localhost:3000/customer/signin';

  static Dio? _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 10),
      // headers: {}
      // dio.options.headers['Authorization'] = 'Bearer $userToken';
      // headers:  <String, dynamic> {   "Authorization" :  'Bearer $userToken' }
      // headers: <String, dynamic>{
      // "Authorization": 'Bearer $globalUserToken'
      // },
    ));

    _dio!.options.headers['Authorization'] = 'Bearer $globalUserToken';
  }

  static Future<Response> login(
      {required String phoneNumber, required String password}) async {
    try {
      final response = await _dio!.post(
        logInUrl,
        data: {
          "phoneNumber": phoneNumber,
          "password": password,
          "rememberMe": true
        },
      );

      // print('ressssssssssssssssssssssssssssspons: ${response}');

      // if (response.statusCode == 200) {
      //   // print('ressssssssssssssssssssssssssssspons: ${response}');
      // }
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  static Future<Response> signUp({
    required String name,
    required String phoneNumber,
    required String? email,
    required String password,
  }) async {
    try {
      final response = email != null && email != ""
          ? await _dio!.post(
              // post with email
              signUpUrl,
              data: {
                "name": name,
                "email": email,
                "phoneNumber": phoneNumber,
                "password": password,
              },
            )
          : await _dio!.post(
              // post without emial
              signUpUrl,
              data: {
                "name": name,
                "phoneNumber": phoneNumber,
                "password": password,
              },
            );

      print('ressssssssssssssssssssssssssssspons: ${response}');

      // if (response.statusCode == 200) {
      //   // print('ressssssssssssssssssssssssssssspons: ${response}');
      // }
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  // #### the old get home categories #### //

  static Future<Response> getCategories() async {
    try {
      final response = await _dio!.get(
        categoriesAllUrl,
        // options: Options()
      );
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  static Future<Response> getHomeMainCategories() async {
    try {
      final response = await _dio!.get(
        getHomeMainCategoriesUrl,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to get main categories: $e');
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
