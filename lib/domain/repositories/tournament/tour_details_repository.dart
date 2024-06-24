import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/models/tournament/tour_detail_model.dart';
import 'package:footballmanager/domain/models/tournament/tournament_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class TourDetailsRepository extends Repository {

  Future<Either<AppError, TourDetailModel>> getTourDetails(String id);
}

/// {@macro authentication_repository}
class TourDetailsRepositoryImpl extends TourDetailsRepository {
  TourDetailsRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, TourDetailModel>> getTourDetails(String id) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/tournaments/details/$id";

      final response =
      await _apiClient.get(url);
      dynamic data = response;
      final result = data.map((e) => TourDetailModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
