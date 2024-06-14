import 'package:footballmanager/domain/models/team/member_team_model.dart';
import 'package:get/get.dart';

import '../../../domain/models/team/team_by_user_model.dart';
import '../../../domain/repositories/team/update_member_team_repository.dart';
import '../../../domain/repositories/team/user_apply_repository.dart';

class DiscoveryController extends GetxController {
  DiscoveryController(this._applyRepository);

  static DiscoveryController get to => Get.find();
  late UserApplyRepository _applyRepository;

  late TeamByUserModel item;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    item = Get.arguments;
  }

  void requestApply(MemberData data) async {
    final result = await _applyRepository.createUser(data);
  }

}
