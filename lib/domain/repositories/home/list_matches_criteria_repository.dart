import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class ListMatchesCriteriaRepository extends Repository {

  Future<Either<AppError, List<MatchCriteriaModel>>> getAllMatchCriteria();
  Future<Either<AppError, List<MatchCriteriaModel>>> getAllMatchCriteriabyUserId(String userId);
  Future<Either<AppError, List<MatchCriteriaModel>>> getAllMatchCriteriabyTeamId(String teamId);
}

/// {@macro authentication_repository}
class ListMatchesCriteriaRepositoryImpl extends ListMatchesCriteriaRepository {
  ListMatchesCriteriaRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<MatchCriteriaModel>>> getAllMatchCriteria() async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/matches-criteria";

      final response =
      await _apiClient.get(url);
      List<dynamic> data = response;
      final result = data.map((e) => MatchCriteriaModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
  @override
  Future<Either<AppError, List<MatchCriteriaModel>>> getAllMatchCriteriabyUserId(String userId) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/matches-criteria/my-criteria/$userId";

      final response =
      await _apiClient.get(url);
      List<dynamic> data = response;
      final result = data.map((e) => MatchCriteriaModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
  @override
  Future<Either<AppError, List<MatchCriteriaModel>>> getAllMatchCriteriabyTeamId(String teamId) async
  {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/matches-criteria/team/$teamId";

      final response =
      await _apiClient.get(url);
      List<dynamic> data = response;
      final result = data.map((e) => MatchCriteriaModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
