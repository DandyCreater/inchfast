import 'package:dio/dio.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.const.dart';
import '../constants/hive_const.dart';

class ApiService {
  final Dio _dio;

  ApiService({String? baseUrl})
      : _dio = Dio(
          BaseOptions(
              baseUrl: baseUrl ?? APIConst.apiBaseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 15),
              responseType: ResponseType.json,
              validateStatus: (status) {
                return status != null && status < 500;
              }),
        ) {
    _dio.interceptors.add(ChuckerDioInterceptor());
  }

  // GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.get(
      SharedPrefConst.token,
    );

    final defaultHeaders = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    final requestOptions = options?.copyWith(
          headers: {
            ...?options.headers,
            ...defaultHeaders,
          },
        ) ??
        Options(headers: defaultHeaders);
    return _dio.get(
      path,
      queryParameters: queryParams,
      options: requestOptions,
    );
  }

  // POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.get(
      SharedPrefConst.token,
    );

    final defaultHeaders = {
      "content-type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    final requestOptions = options?.copyWith(
          headers: {
            ...?options.headers,
            ...defaultHeaders,
          },
        ) ??
        Options(headers: defaultHeaders);
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParams,
      options: requestOptions,
    );
  }

  // PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return _dio.put(path,
        data: data, queryParameters: queryParams, options: options);
  }

  // DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return _dio.delete(path,
        data: data, queryParameters: queryParams, options: options);
  }
}
