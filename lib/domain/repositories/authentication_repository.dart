
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../common/app_errors/app_error.dart';
import '../../data/remote/authentication_remote_data_source.dart';
import '../models/authentication/user_infor_model.dart';



/// {@template authentication_repository}
/// [AuthenticationRepository] class have different functions that are used to
/// user authentication
/// {@endtemplate}
abstract class AuthenticationRepository extends Repository {
  /// {@template authentication_repository_login}
  /// API called when logging in
  /// {@endtemplate}
  Future<Either<AppError, UserInfoModel>> login(String email, String password);

  /// {@template authentication_repository_logout}
  /// API to call when logging out
  /// {@endtemplate}
  Future<Either<AppError, bool>> logout();
}

/// {@macro authentication_repository}
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(this._authRemoteDataSource);

  late final AuthenticationRemoteDataSource _authRemoteDataSource;

  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, UserInfoModel>> login(
      String email,
      String password,
      ) async {
    try {
      final response = await _authRemoteDataSource.login(email, password);
      final result = response.toDomain();
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }

  /// {@macro authentication_repository_logout}
  @override
  Future<Either<AppError, bool>> logout() async {
    try {
      final result = await _authRemoteDataSource.logout();
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
