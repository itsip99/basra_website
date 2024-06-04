import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:stsj/core/service/API/Exception.dart';
import 'package:stsj/core/service/API/network/base_api_service.dart';

class NetworkAPIService extends BaseAPIService {
  final _dio = Dio();

  @override
  Future getAPI(String url) async {
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);

    dynamic responseJson;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.get(url,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: true,
            // sendTimeout: Duration(seconds: 60), // 15 seconds
            // receiveTimeout: Duration(seconds: 60) // 15 seconds
          ));

      responseJson = returnReponseJSON(response);
    } on DioException catch (e) {
      // print(e);
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw TimeoutException('');
      } else if (e.type == DioExceptionType.badResponse) {
        String errorDescription = 'Something went wrong. Please try again';
        final int statusCode = e.response?.statusCode ?? 0;

        // final int statusCode = 403;

        if (e.response != null) {
          if (statusCode == 400) {
            errorDescription = 'Bad Request. Please check your request.';
          } else if (statusCode == 401) {
            errorDescription = 'Unauthorized. Please log in.';
          } else if (statusCode == 403) {
            errorDescription =
                'Forbidden. You do not have permission to access this resource.';
          } else if (statusCode == 404) {
            errorDescription = 'The requested resource was not found.';
          } else if (statusCode == 429) {
            errorDescription = 'Too Many Requests. Please try again later.';
          } else if (statusCode >= 500) {
            errorDescription = 'Server error. Please try again later.';
          }
        }

        throw FetchDataException(
            'status_code: $statusCode \n ${errorDescription} ');
      } else if (e.type == DioExceptionType.cancel) {
        throw FetchDataException('Request was canceled');
      } else {
        throw NoInternetException('');
      }
    }
    return responseJson;
  }

  @override
  Future postAPI(Map? data, String? url) async {
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.sendTimeout = const Duration(seconds: 60);

    dynamic responseJson;
    var body = json.encode(data);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      if (kDebugMode) {
        // _dio.interceptors.add(
        //   TalkerDioLogger(
        //     settings: const TalkerDioLoggerSettings(
        //       printRequestHeaders: true,
        //       printResponseHeaders: true,
        //       printResponseMessage: true,
        //     ),
        //   ),
        // );
      }

      final response = await _dio.post(url!,
          data: body,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: true,
            // sendTimeout: Duration(seconds: 60), // 15 seconds
            // receiveTimeout: Duration(seconds: 60) // 15 seconds
          ));

      responseJson = returnReponseJSON(response);
    } on DioException catch (e) {
      // print(e);
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw TimeoutException('');
      } else if (e.type == DioExceptionType.badResponse) {
        String errorDescription = 'Something went wrong. Please try again';
        final int statusCode = e.response?.statusCode ?? 0;

        // final int statusCode = 403;

        if (e.response != null) {
          if (statusCode == 400) {
            errorDescription = 'Bad Request. Please check your request.';
          } else if (statusCode == 401) {
            errorDescription = 'Unauthorized. Please log in.';
          } else if (statusCode == 403) {
            errorDescription =
                'Forbidden. You do not have permission to access this resource.';
          } else if (statusCode == 404) {
            errorDescription = 'The requested resource was not found.';
          } else if (statusCode == 429) {
            errorDescription = 'Too Many Requests. Please try again later.';
          } else if (statusCode >= 500) {
            errorDescription = 'Server error. Please try again later.';
          }
        }

        throw FetchDataException(
            ' status_code: $statusCode  \n $errorDescription ');
      } else if (e.type == DioExceptionType.cancel) {
        throw FetchDataException('Request was canceled');
      } else {
        throw NoInternetException('');
      }
    }
    return responseJson;
  }

  dynamic returnReponseJSON(response) {
    switch (response.statusCode) {
      case 200:
        if (response.data is String) {
          return jsonDecode(response.data);
        } else if (response.data is Map<String, dynamic>) {
          try {
            Map<String, dynamic> jsonMap = response.data;

            return jsonMap;
          } catch (error) {
            // Tangani kesalahan jika terjadi kesalahan dalam decoding JSON
            throw APIException('$error: ${response.data}');
          }
        } else {
          // Jika response tidak sesuai dengan string atau Map<String, dynamic>
          throw APIException(
              'Error decoding JSON: Invalid JSON structure: ${response.data}');
        }

      case 400:
        throw InvalidURLException();
      default:
        throw FetchDataException();
    }
  }
}
