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
        return ServerFailure('Connection timeout with Api\'s Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api\' Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with Api\' Server');
      case DioExceptionType.badCertificate:
        return ServerFailure(
          ' The server\'s SSL certificate is not valid or trusted.',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure("The request was canceled.");
      case DioExceptionType.connectionError:
        return ServerFailure(
          "There is a connection error, please make sure you have a good internet.",
        );
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure("No Internet Connection.");
        }
        return ServerFailure("Unexcpected Error, please try again.");

      default:
        return ServerFailure('Oops There was an Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure("The server is down, please try later :3");
    } else {
      return ServerFailure("idk what happened, ask google about it");
    }
  }
}
