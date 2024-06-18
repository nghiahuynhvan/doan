import '../../common/services/network/custom_http_client.dart';
import '../models/dto/team/team_by_user_dto.dart';

abstract class TeamByUserRemoteDataSource {
  Future<List<TeamByUserDTO>> getTeamByUserId({required String id});
}

class TeamByUserRemoteDataSourceImpl extends TeamByUserRemoteDataSource {
  TeamByUserRemoteDataSourceImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  @override
  Future<List<TeamByUserDTO>> getTeamByUserId({required String id}) async {
    final url = "https://soccermatch-production.up.railway.app/api/teams/my-team/$id";

    final response =
        await _apiClient.get(url);
    List<dynamic> jsonData = response;
    final result = jsonData.map((e) => TeamByUserDTO.fromJson(e)).toList();
    print("########${result}");
    return result;
  }
}
