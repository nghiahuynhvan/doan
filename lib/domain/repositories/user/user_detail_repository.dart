import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/user/user_detail_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../../data/models/dto/user/user_detail_dto.dart';
import '../../models/team/member_team_model.dart';

/// {@template authentication_repository}
/// [AuthenticationRepository] class have different functions that are used to
/// user authentication
/// {@endtemplate}
abstract class UserDetailRepository extends Repository {
  /// {@template authentication_repository_login}
  /// API called when logging in
  /// {@endtemplate}
  Future<Either<AppError, UserModel>> getUserDetail({required String idUser});
  Future<Either<AppError,dynamic>> deleteAccount(String idUser);
}

/// {@macro authentication_repository}
class UserDetailRepositoryImpl extends UserDetailRepository {
  UserDetailRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, UserModel>> getUserDetail({required String idUser}) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/users/$idUser";
      final response = await _apiClient.get(url);
      final result = UserDTO.fromJson(response);
      return Right(result.toDomain());
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
  @override
  Future<Either<AppError,dynamic>> deleteAccount(String idUser)async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/users/$idUser";
      final response = await _apiClient.delete(url);
      print('##${response}');
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
