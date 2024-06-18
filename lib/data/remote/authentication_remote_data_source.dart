import '../../common/services/network/custom_http_client.dart';
import '../models/dto/authentication/user_infor_dto.dart';

/// {@template authentication_remote_login}
/// API remote related to authentication
/// {@endtemplate}
abstract class AuthenticationRemoteDataSource {
  Future<UserInfoDTO> login(String email, String password);

  Future<bool> logout();
}

/// {@macro authentication_remote_login}
class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl(this._apiClient);

  late final CustomHttpClient _apiClient;

  @override
  Future<UserInfoDTO> login(String email, String password) async {
    final url = "${"https://soccermatch-production.up.railway.app/api/auth/basic/login"}";
    final queryParameters = {
      "username": email,
      "password": password

    };
    final response = await _apiClient.post(url, body: queryParameters);
    var result = UserInfoDTO.fromJson(response);
    return result;
  }

  @override
  Future<bool> logout() async {
    final response = {};
    return true;
  }
}
