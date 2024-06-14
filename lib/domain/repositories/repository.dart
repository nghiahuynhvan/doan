// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../common/app_errors/network_error.dart';

/// Base for all use cases
class Repository {
  /// Handler dio error to return Left Either
  Left<L, R> LeftAPI<L, R>(DioError dioError) {
    if (dioError.response?.data is NetworkError) {
      return Left(NetworkError() as L);
    } else {
      return Left(dioError.response?.data);
    }
  }
}
