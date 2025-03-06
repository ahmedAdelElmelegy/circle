import 'dart:io';

import 'package:circletraning/core/utils/app_constants.dart';
import 'package:circletraning/data/api_url/api_.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  final String _baseUrl = ApiURl.baseUrl;
  final Dio _dio;
  final SharedPreferences sharedPreferences;
  late String lang;
  late String token;
  ApiServices(this._dio, this.sharedPreferences) {
    token = sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
    lang = sharedPreferences.getString(AppConstants.lang) ?? "ar";

    _dio
      ..options.baseUrl = _baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        'lang': lang,
        'Authorization': token,
        'Accept': 'application/json',
      };
  }

  Future<Response> get(
      {required String endpoint, Map<String, dynamic>? query}) async {
    try {
      final response =
          await _dio.get('$_baseUrl$endpoint', queryParameters: query);
      return response;
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  void updataHeader({String? token}) {
    token = token ?? this.token;
    this.token = token;
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': token,
    };
  }

  Future<Response> postWithImage(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
