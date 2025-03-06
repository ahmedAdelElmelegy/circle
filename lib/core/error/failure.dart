import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromCode(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('Please check your internet connection');
        }
        return ServerFailure('Unknown');
    }
  }

  factory ServerFailure.fromCode(int code, dynamic response) {
    if (code == 400 || code == 401 || code == 403) {
      return ServerFailure(response['message']);
    } else if (code == 404) {
      return ServerFailure('Your request is not valid');
    } else if (code == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Something went wrong');
    }
  }
}
