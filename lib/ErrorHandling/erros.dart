// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.sendTimeout:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.unknown:
        message = "No internet connection";
        break;
      case DioErrorType.connectionError:
        message = "connectionError";
        break;
      case DioErrorType.badCertificate:
        message = "Bad Certificate";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String message = '';

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
