import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class CreateMatchesCriteriaRepository extends Repository {

  Future<Either<AppError, MatchCriteriaModel>> CreateMatchesCriteria(MatchCriteriaModel data);
}

/// {@macro authentication_repository}
class CreateMatchesCriteriaRepositoryImpl extends CreateMatchesCriteriaRepository {
  CreateMatchesCriteriaRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, MatchCriteriaModel>> CreateMatchesCriteria(MatchCriteriaModel data) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/matches-criteria";

      final response =
      await _apiClient.post(url,body: data.toJson());
      print('##${response}');
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
