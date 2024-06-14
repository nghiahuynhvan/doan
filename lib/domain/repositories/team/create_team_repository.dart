import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/team/team_by_user_model.dart';
import '../../models/team/member_team_model.dart';

/// {@template authentication_repository}
/// [AuthenticationRepository] class have different functions that are used to
/// user authentication
/// {@endtemplate}
abstract class CreateTeamRepository extends Repository {
  Future<Either<AppError, TeamByUserModel>> createTeam(TeamByUserModel data);
}

/// {@macro authentication_repository}
class CreateTeamRepositoryImpl extends CreateTeamRepository {
  CreateTeamRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  @override
  Future<Either<AppError, TeamByUserModel>> createTeam(TeamByUserModel data) async {
    try {

      final url = "http://192.168.4.156:8080/api/teams";
      final response = await _apiClient.post(url,body: data.toJson());
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}