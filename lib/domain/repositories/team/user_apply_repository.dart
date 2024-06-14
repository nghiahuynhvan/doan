import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/team/member_team_model.dart';

/// {@template authentication_repository}
/// [AuthenticationRepository] class have different functions that are used to
/// user authentication
/// {@endtemplate}
abstract class UserApplyRepository extends Repository {
  /// {@template authentication_repository_login}
  /// API called when logging in
  /// {@endtemplate}
  Future<Either<AppError, dynamic>> createUser(MemberData data);
}

/// {@macro authentication_repository}
class UserApplyRepositoryImpl extends UserApplyRepository {
  UserApplyRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, dynamic>> createUser(MemberData data) async {
    try {
      final url = "http://192.168.4.156:8080/api/team-members";
      final response = await _apiClient.post(url, body: data.toJson());
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
