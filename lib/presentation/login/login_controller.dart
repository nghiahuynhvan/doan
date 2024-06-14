import 'package:footballmanager/common/constants/pref_constants.dart';
import 'package:footballmanager/common/services/app_status.dart';
import 'package:footballmanager/domain/repositories/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routing/route_path.dart';
import '../../domain/models/authentication/user_infor_model.dart';
import '../../domain/serviceable/auth_serviceable.dart';

class LoginController extends GetxController {
  LoginController(this.authenticationRepository);
  static LoginController get to => Get.find();

  final AuthenticationRepository authenticationRepository;
  final storage = Get.find<SharedPreferences>();

  var userInfor = Rxn<UserInfoModel>();



  //

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void handleLogin({required String userName, required String password}) async {
    AppStatus.dismissLoading();
    final result = await authenticationRepository.login(userName, password);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      userInfor.value = right;
      print("#####${userInfor.value}");
    });
    navigationHome();

  }
  void navigationHome()
  {
    if(userInfor.value != '')
      {
        Get.offNamed(Routers.dashboard);
        storage.setString(PrefsConstants.idUser, userInfor.value!.id);
        AuthStore.to.getAccessToken();
      }
  }
}
