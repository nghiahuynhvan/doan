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
abstract class UpdateStatusTeamRepository extends Repository {
  Future<Either<AppError, dynamic>> updateStatusTeam(String active, String idTeam);
}

/// {@macro authentication_repository}
class UpdateStatusTeamRepositoryImpl extends UpdateStatusTeamRepository {
  UpdateStatusTeamRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  @override
  Future<Either<AppError, dynamic>> updateStatusTeam(String active,String idTeam) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/teams/update-status";
      var body = {
        "status": active,
        "teamIds": [idTeam]
      };

      final response = await _apiClient.post(url, body: body);
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
