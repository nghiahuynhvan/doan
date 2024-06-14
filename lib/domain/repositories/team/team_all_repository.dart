import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../data/remote/team_all_remote_data_source.dart';
import '../../../data/remote/team_by_user_remote_data_source.dart';

/// {@template authentication_repository}
/// [AuthenticationRepository] class have different functions that are used to
/// user authentication
/// {@endtemplate}
abstract class TeamAllRepository extends Repository {
  /// {@template authentication_repository_login}
  /// API called when logging in
  /// {@endtemplate}
  Future<Either<AppError, List<TeamByUserModel>>> getTeamAll();
}

/// {@macro authentication_repository}
class TeamAllRepositoryImpl extends TeamAllRepository {
  TeamAllRepositoryImpl(this._allDataSource);

  late final TeamAllRemoteDataSource _allDataSource;

  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<TeamByUserModel>>> getTeamAll() async {
    try {
      final response = await _allDataSource.getTeamAll();
      final result = response.map((e) => e.toDomain()).toList();
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }
}
