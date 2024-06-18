import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/authentication/register_model.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../common/services/network/custom_http_client.dart';
import '../../models/home/matches_criteria_model.dart';


abstract class RegisterRepository extends Repository {

  Future<Either<AppError, dynamic>> register(String fullname, String email, String username, String password);
}

/// {@macro authentication_repository}
class RegisterRepositoryImpl extends RegisterRepository {
  RegisterRepositoryImpl(this._apiClient);

  late final CustomHttpClient _apiClient;
  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, dynamic>> register(String fullname, String email, String username, String password) async {
    try {
      final url = "https://soccermatch-production.up.railway.app/api/auth/register";
      final queryParameters = {
        "eRole" : "PLAYER" };
      final body =
          {
            "username" : username,
            "password" : password,
            "email" : email,
            "fullName" : fullname
          };
      final response =
      await _apiClient.post(url,queryParameters: queryParameters, body: body);
      print('##${response}');
      return response;
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}



