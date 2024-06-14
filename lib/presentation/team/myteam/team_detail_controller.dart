import 'package:footballmanager/presentation/team/team_controller.dart';
import 'package:get/get.dart';

import '../../../common/services/app_status.dart';
import '../../../domain/models/team/team_by_user_model.dart';
import '../../../domain/models/team/member_team_model.dart';
import '../../../domain/repositories/team/list_apply_user_repository.dart';
import '../../../domain/repositories/team/update_member_team_repository.dart';

class TeamDetailController extends GetxController {
  TeamDetailController(this.listApplyUserRepository,this._memberTeamRepository);
  static TeamDetailController get to => Get.find();
  late TeamByUserModel item;
  late ListApplyUserRepository listApplyUserRepository;

  var itemApplyUser = Rxn<List<MemberData>>();
  late updateMemberTeamRepository _memberTeamRepository;

  @override
  void onInit()
  {
    super.onInit();
    item = Get.arguments;
  }

  Future<void> fetchListApplyPending({required String teamId, required String status}) async {
    AppStatus.dismissLoading();
    final result = await listApplyUserRepository.getUserPending(teamId: teamId, status: status);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemApplyUser.value = right;
      print("#######$itemApplyUser.value");
    });
  }

  void updateMemberTeam(String id, MemberData data)async{
    final result = await _memberTeamRepository.updateMemberTeam(id, data);
  }
}
