import 'dart:io';
import 'package:circle/core/network/data_source/remote/exception/app_exeptions.dart';
import 'package:circle/core/network/models/response/base/error_response.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";

    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "Bad SSL Certificate";
              break;
            case DioExceptionType.connectionError:
              if (error.error is SocketException) {
                errorDescription = "No internet connection";
              } else {
                errorDescription = "Connection error occurred";
              }
              break;
            case DioExceptionType.unknown:
              if (error.error is SocketException) {
                errorDescription = "No internet connection";
              } else {
                errorDescription = "Unknown error occurred";
              }
              break;

            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 404:
                case 500:
                case 503:
                  errorDescription = "There is a problem with the server";
                  break;

                case 422:
                  Error401Response error422Response =
                      Error401Response.fromJson(error.response?.data);
                  if (error422Response.code == 422) {
                    errorDescription = error422Response.message.toString();
                  } else {
                    errorDescription = "Unprocessable entity";
                  }
                  break;

                case 401:
                  Error401Response error401Response =
                      Error401Response.fromJson(error.response?.data);
                  if (error401Response.code == 401) {
                    errorDescription = error401Response.message.toString();
                  } else {
                    errorDescription = "Unauthorized request";
                  }
                  break;

                default:
                  ErrorResponse errorResponse =
                      ErrorResponse.fromJson(error.response?.data);
                  if (errorResponse.errors != null &&
                      errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription =
                        "Server error - ${error.response?.statusCode}";
                  }
              }
              break;
          }
        } else if (error is SocketException) {
          errorDescription = "No internet connection";
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "Unknown error type";
    }

    return errorDescription;
  }
}

class ApiError2Handler {
  static AppException handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return NetworkException("No internet connection");
    } else if (error is AppException) {
      return error;
    } else {
      return UnknownException(
        "An unexpected error occurred",
        details: error.toString(),
      );
    }
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return NetworkException("Request was cancelled");

      case DioExceptionType.connectionTimeout:
        return NetworkException("Connection timeout");

      case DioExceptionType.receiveTimeout:
        return NetworkException("Receive timeout");

      case DioExceptionType.sendTimeout:
        return NetworkException("Send timeout");

      case DioExceptionType.badCertificate:
        return NetworkException("SSL certificate error");

      case DioExceptionType.connectionError:
        if (error.error is SocketException) {
          return NetworkException("No internet connection");
        }
        return NetworkException("Connection error occurred");

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return NetworkException("No internet connection");
        }
        return UnknownException(
          "Unknown error occurred",
          details: error.message,
        );
    }
  }

  static AppException _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    switch (statusCode) {
      case 400:
        return ValidationException(
          _extractErrorMessage(responseData, "Bad request"),
          code: "400",
          details: responseData,
        );

      case 401:
        return AuthenticationException(
          _extractErrorMessage(responseData, "Unauthorized"),
          code: "401",
          details: responseData,
        );

      case 403:
        return AuthenticationException(
          _extractErrorMessage(responseData, "Access forbidden"),
          code: "403",
        );

      case 404:
        return ServerException(
          "Resource not found",
          statusCode: 404,
        );

      case 422:
        return ValidationException(
          _extractErrorMessage(responseData, "Validation failed"),
          code: "422",
          details: responseData,
        );

      case 500:
      case 502:
      case 503:
        return ServerException(
          "Server error occurred",
          statusCode: statusCode,
        );

      default:
        return ServerException(
          "Server error - ${statusCode ?? 'Unknown'}",
          statusCode: statusCode,
          details: responseData,
        );
    }
  }

  static String _extractErrorMessage(
      dynamic responseData, String defaultMessage) {
    if (responseData == null) return defaultMessage;

    try {
      if (responseData is Map) {
        // Try common error message keys
        if (responseData['message'] != null) {
          return responseData['message'].toString();
        }
        if (responseData['error'] != null) {
          return responseData['error'].toString();
        }
        if (responseData['errors'] != null) {
          final errors = responseData['errors'];
          if (errors is Map && errors.isNotEmpty) {
            // Return first error message
            return errors.values.first.toString();
          }
        }
      }
    } catch (e) {
      return defaultMessage;
    }

    return defaultMessage;
  }

  // User-friendly error messages
  static String getUserMessage(AppException exception) {
    if (exception is NetworkException) {
      return "Please check your internet connection and try again";
    } else if (exception is AuthenticationException) {
      return "Please login again to continue";
    } else if (exception is ValidationException) {
      return exception.message;
    } else if (exception is ServerException) {
      return "Something went wrong. Please try again later";
    } else {
      return "An unexpected error occurred";
    }
  }
}
