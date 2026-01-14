import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return const ServerFailure('Unexpected Error, Please try again!');
      default:
        return const ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    String message = 'Opps There was an Error, Please try again';
    
    if (response != null && response is Map) {
      if (response['error'] != null && response['error']['message'] != null) {
        message = response['error']['message'];
      } else if (response['message'] != null) {
        message = response['message'];
      }
    }

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure(message);
    }
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.errMessage);
}

class ParsingFailure extends Failure {
  const ParsingFailure(super.errMessage);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String? message]) : super(message ?? 'An unexpected error occurred');
}
