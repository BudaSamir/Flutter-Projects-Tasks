import 'package:dio/dio.dart';
import 'package:pagination_with_cubit/viewModels/database/local/cache_helper.dart';

const String baseUrl = '';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(baseUrl: baseUrl, headers: {'Accept': 'application/json'}));
  }

  Future<Response> getData(
      {required String url,
      Map<String, double>? queryParameters,
      ProgressCallback? onReceiveProgress,
      String? token}) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ""}',
        'Accept-Language':
            CacheHelper().get(key: 'LOCALE') == 'en_EN' ? 'en' : 'ar',
      };
      final Response response = await dio.get(url,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postData({
    required url,
    Map<String, dynamic>? data,
    FormData? formData,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
        'Accept-Language':
            CacheHelper().get(key: 'LOCALE') == 'en_EN' ? 'en' : 'ar',
        'Content-Type':
            data != null ? "application/json" : 'multipart/form-data',
      };
      final Response response = await dio.post(
        url,
        data: data ?? formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept-Language':
          CacheHelper().get(key: 'LOCALE') == 'en_EN' ? 'en' : 'ar',
      'Content-Type': "application/json"
    };
    return await dio.patch(url, data: data);
  }

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Accept-Language':
            CacheHelper().get(key: 'LOCALE') == 'en_EN' ? 'en' : 'ar',
      };
      final Response response = await dio.delete(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
