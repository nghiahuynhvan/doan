import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/models/tournament/tournament_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';
import '../../models/tournament/tour_detail_model.dart';


abstract class TournamentRepository extends Repository {

  Future<Either<AppError, List<TournamentModel>>> getTournament();
  Future<Either<AppError, TourDetailModel>> getTourDetails(String id);
}

/// {@macro authentication_repository}
class TournamentRepositoryImpl extends TournamentRepository {
  TournamentRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<TournamentModel>>> getTournament() async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/tournaments";

      final response =
      await _apiClient.get(url);
      List<dynamic> data = response;
      final result = data.map((e) => TournamentModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
  @override
  Future<Either<AppError, TourDetailModel>> getTourDetails(String id) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/tournaments/details/$id";

      final response =
      await _apiClient.get(url);

      final result = TourDetailModel.fromJson(response);
      print('###############${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
