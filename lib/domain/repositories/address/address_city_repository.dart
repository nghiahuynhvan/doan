import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/address/address_city_model.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class AddressCityRepository extends Repository {

  Future<Either<AppError, List<AddressCityModel>>> getCity();
}

/// {@macro authentication_repository}
class AddressCityRepositoryImpl extends AddressCityRepository {
  AddressCityRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<AddressCityModel>>> getCity() async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/data-address/city";

      final response =
      await _apiClient.get(url);
      List<dynamic> data = response;
      final result = data.map((e) => AddressCityModel.fromJson(e)).toList();
      print('@@@@@@@@@@@${result}');
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
