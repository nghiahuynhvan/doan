import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class CreateMatchRepository extends Repository {

  Future<Either<AppError, MatchModel>> createMatch(MatchModel data);
}

/// {@macro authentication_repository}
class CreateMatchRepositoryImpl extends CreateMatchRepository {
  CreateMatchRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, MatchModel>> createMatch(MatchModel data) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/matches";

      final response =
      await _apiClient.post(url,body: data.toJson());
      print('##${response}');
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}



