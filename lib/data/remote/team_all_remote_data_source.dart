import '../../common/services/network/custom_http_client.dart';
import '../models/dto/team/team_by_user_dto.dart';

abstract class TeamAllRemoteDataSource {
  Future<List<TeamByUserDTO>> getTeamAll();
}

class TeamAllRemoteDataSourceImpl extends TeamAllRemoteDataSource {
  TeamAllRemoteDataSourceImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  @override
  Future<List<TeamByUserDTO>> getTeamAll() async {
    final url = "https://soccermatch-production.up.railway.app/api/teams";

    final response =
    await _apiClient.get(url);
    List<dynamic> jsonData = response;
    final result = jsonData.map((e) => TeamByUserDTO.fromJson(e)).toList();
    return result;
  }
}
