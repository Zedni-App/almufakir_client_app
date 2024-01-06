
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'failure.dart';

Failure formatFailure(dynamic error) {
  if (kDebugMode) {
    print(error.toString());
  }
  if (error is DioException) {
    return ServerFailure.dio(error);
  } else {
    return const EmptyArgumentFailure("هناك خطأ غير معروف ،عذراََ");
  }
}
