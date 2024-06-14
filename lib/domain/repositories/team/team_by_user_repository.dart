
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footballmanager/data/models/dto/team/team_by_user_dto.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/repositories/repository.dart';

import '../../../common/app_errors/app_error.dart';
import '../../../data/remote/team_by_user_remote_data_source.dart';




/// {@template authentication_repository}
/// [AuthenticationRepository] class have different functions that are used to
/// user authentication
/// {@endtemplate}
abstract class TeamByUserRepository extends Repository {
  /// {@template authentication_repository_login}
  /// API called when logging in
  /// {@endtemplate}
  Future<Either<AppError,List<TeamByUserModel>>> getTeamByUserId({
    required String id,
});

}

/// {@macro authentication_repository}
class TeamByUserRepositoryImpl extends TeamByUserRepository {
  TeamByUserRepositoryImpl(this._byUserRemoteDataSource);

  late final TeamByUserRemoteDataSource _byUserRemoteDataSource;

  /// {@macro authentication_repository_login}
  @override
  Future<Either<AppError, List<TeamByUserModel>>> getTeamByUserId(
  {
    required String id,
}
      ) async {
    try {
      final response = await _byUserRemoteDataSource.getTeamByUserId(id: id);
      final result = response.map((e) => e.toDomain()).toList();
      return Right(result);
    } on DioError catch (e) {
      return LeftAPI(e);
    }
  }

}
