import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.dio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("إتصال الشبكة ضعيف،حاول مجددا");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("إتصال الشبكة ضعيف،حاول مجددا");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("إتصال الشبكة ضعيف،حاول مجددا");
      case DioExceptionType.badCertificate:
        return const ServerFailure(
            "شهادة خاظئة تأكد من الحصول على التطبيق الرسمي،او راجعنا بشكوى");
      case DioExceptionType.cancel:
        return const ServerFailure("تم قطع الإتصال");
      case DioExceptionType.connectionError:
        return const ServerFailure("تأكد من إتصالك بالإنترنت");
      case DioExceptionType.unknown:
        return const ServerFailure("عذرا هناك خطأ غير معروف");
      case DioExceptionType.badResponse:
        if (e.response!.statusCode == 404) {
          return const ServerFailure(
              "تم فقدان الرابط المظلوب الوصول إلبه،حاول لاحقا");
        } else {
          return const ServerFailure(" ,خطأ في السبرفر حاول لاحقا");
        }
    }
  }
}

class DataBaseFailure extends Failure {
  const DataBaseFailure(super.message);
}

class EmptyArgumentFailure extends Failure {
  const EmptyArgumentFailure(super.message);
}

Failure formatFailure(dynamic error) {
  if (kDebugMode) {
    print(error.toString());
  }
  if (error is DioException) {
    return ServerFailure.dio(error);
  } else {
    return EmptyArgumentFailure(error.toString());
  }
}
