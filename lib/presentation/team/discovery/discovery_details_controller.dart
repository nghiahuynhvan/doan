import 'package:footballmanager/domain/models/team/member_team_model.dart';
import 'package:get/get.dart';

import '../../../common/services/app_status.dart';
import '../../../domain/models/team/team_by_user_model.dart';
import '../../../domain/models/user/user_detail_model.dart';
import '../../../domain/repositories/team/update_member_team_repository.dart';
import '../../../domain/repositories/team/user_apply_repository.dart';
import '../../../domain/repositories/user/user_detail_repository.dart';
import '../../../domain/serviceable/auth_serviceable.dart';

class DiscoveryController extends GetxController {
  DiscoveryController(this._applyRepository,this.userDetailRepository);

  static DiscoveryController get to => Get.find();
  late UserApplyRepository _applyRepository;
  final authStoreService = AuthStore.to;

  late TeamByUserModel item;
  late UserDetailRepository userDetailRepository;

  var userDetail = Rxn<UserModel>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDetails();
    item = Get.arguments;
  }

  void requestApply(MemberData data) async {
    final result = await _applyRepository.createUser(data);
  }
  Future<void> getUserDetails() async {
    AppStatus.dismissLoading();
    final result = await userDetailRepository.getUserDetail(
        idUser: authStoreService.idUser);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      userDetail.value = right;
    });
  }

}
