import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class ListMatchesByTeamRepository extends Repository {

  Future<Either<AppError, List<MatchModel>>> getMachesByTeam({required String teamId});
}

/// {@macro authentication_repository}
class ListMatchesByTeamRepositoryImpl extends ListMatchesByTeamRepository {
  ListMatchesByTeamRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<MatchModel>>> getMachesByTeam({required String teamId}) async {
    try {
      final url = "http://192.168.4.156:8080/api/matches/team/$teamId";

      final response =
      await _apiClient.get(url);
      List<dynamic> data = response;
      final result = data.map((e) => MatchModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
