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
abstract class ListApplyUserRepository extends Repository {
  /// {@template authentication_repository_login}
  /// API called when logging in
  /// {@endtemplate}
  Future<Either<AppError, List<MemberData>>> getUserPending(
      {required String teamId, required String status});
}

/// {@macro authentication_repository}
class ListApplyUserRepositoryImpl extends ListApplyUserRepository {
  ListApplyUserRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<MemberData>>> getUserPending(
      {required String teamId, required String status}) async {
    try {
      final url = "http://192.168.4.156:8080/api/team-members/$teamId/all";
      final queryParameters = {
        "status": status
      };
      final response =
          await _apiClient.get(url,queryParameters:queryParameters);
      List<dynamic> data = response;
      final result = data.map((e) => MemberData.fromJson(e )).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
