import 'package:dio/dio.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';
import 'package:select_shop/main.dart';

class DioHelper {
  // static String baseUrl = 'https://crm.specialline.info/api/';
  // static String baseUrl = 'http://10.255.254.13:3000';
  // static String baseUrl = 'http://74.208.189.16:3000';

  // static const String baseUrl = "https://6374-217-165-246-246.ngrok-free.app";
  // static const String baseUrl = "10.255.254.24";
  static String baseUrl = 'http://10.255.254.103:3000';
  // static const String? userToken = globalUserToken ;

  static String logInUrl = '/customer/signin';
  static String signUpUrl = '/customer/signup';

  // the old categories url: and this used to get all categories
  static String categoriesAllUrl = '/category/all';

  // the new getHomeMainCategoriesUrl
  static String getHomeMainCategoriesUrl = '/category/main';
  static String getHomeCollectionUrl = '/product/collection';

  static const String getEmiratesUrl = "/address-city/all";

  static const String getSubCategoriesUrl = "/category/children/";
  static const String getProductsByCategoryIDUrl = "/product/categoryProducts/";
  static const String getProductsBySubCategoryIDUrl =
      "/product/categoryProducts/";
  static const String getCartUrl = "/cart/open/";

  static Dio? _dio;

  // #### dio init #### //

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

    _dio!.options.headers['Authorization'] = 'Bearer $globalCachedUserToken';
  }

  // #### login #### //
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

  // #### signUp #### //
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

  // #### the olddddd get home categories #### //

  // static Future<Response> getCategories() async {
  //   try {
  //     final response = await _dio!.get(
  //       categoriesAllUrl,
  //       // options: Options()
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception('Failed to login: $e');
  //   }
  // }

  // #### the newwww get home categories #### //
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

  // #### the newwww get home categories #### //
  static Future<Response> getNewProductsHome(
      {required final String? collection}) async {
    try {
      final response = await _dio!.post(getHomeCollectionUrl, data: {
        "page": 1,
        "collection": collection,
      });

      return response;
    } catch (e) {
      throw Exception('Failed to get main categories: $e');
    }
  }

  // #### get emirates or cites #### //
  static Future<Response> getAllEmirates() async {
    try {
      final Response response = await _dio!.get(
        getEmiratesUrl,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // #### get all subCategorys of main category #### //
  static Future<Response> getAllSubCategoryOfMainCategory(
      {required final int mainCategoryID}) async {
    print("geeeeeeeeeeeeeeeeeeeeeeeeeeeeet sub categories");
    try {
      // pass the main category id
      final Response response = await _dio!.get(
        getSubCategoriesUrl + mainCategoryID.toString(),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // #### get all products of main category #### //
  static Future<Response> getAllProductsOfMainCategory(
      {required final int mainCategoryID}) async {
    try {
      final Response response = await _dio!.post(
        getProductsByCategoryIDUrl + mainCategoryID.toString(),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // #### get all products of sub category #### //
  static Future<Response> getAllProductsOfSubCategory(
      {required final int subCategoryID}) async {
    try {
      final Response response = await _dio!.post(
        getProductsBySubCategoryIDUrl + subCategoryID.toString(),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // #### get all user cart #### //
  static Future<Response> getUserCart(
      // {required final int subCategoryID}
      ) async {
    try {
      final Response response = await _dio!.get(
        getCartUrl,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // #### genral dio getData #### //
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

  // #### genral dio posData #### //
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

  //  // #### sendNotifications #### //
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

  // #### genral dio putData #### //
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

  // #### genral dio deleteData #### //
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
