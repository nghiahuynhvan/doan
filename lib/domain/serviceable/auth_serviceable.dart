
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/pref_constants.dart';

class AuthStore extends GetxService {
  AuthStore(this._storage);

  final SharedPreferences _storage;

  static AuthStore get to => Get.find();

  RxBool isHaveInternet = true.obs;
  RxBool isLogged = false.obs;
  RxBool isAuthentication = false.obs;
  String authToken = '';
  String accessToken = '';
  String idUser = '';
  String displayName = '';
  String idTeam = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    getAccessToken();
    getIdTeam();
  }


  void getAccessToken() {
    idUser = _storage.getString(PrefsConstants.idUser) ?? '';

    if (idUser.isNotEmpty) {
      isLogged.value = true;
    } else {
      isLogged.value = false;
    }
  }
  void getIdTeam()
  {
    idTeam = _storage.getString(PrefsConstants.idTeam) ?? '';
    print('#####!!${idTeam}');
  }

  Future<void> logout({required bool isGoToLogin}) async {
    // Clear storage
    await _clearStorage();
    _clearToken();
    isLogged.value = false;
  }

  void _clearToken() {
    idUser = '';
    idTeam = '';
  }

  Future<void> _clearStorage() async {
        await _storage.clear();

  }
}
