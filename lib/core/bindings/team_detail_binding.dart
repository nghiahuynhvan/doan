import 'package:footballmanager/presentation/team/myteam/team_detail_controller.dart';
import 'package:get/get.dart';

import '../../domain/repositories/team/list_apply_user_repository.dart';
import '../../domain/repositories/team/update_member_team_repository.dart';

class TeamDetailBinding extends Bindings {
  @override
  void dependencies()
  {
    Get
      ..put<updateMemberTeamRepository>(updateMemberTeamRepositoryImpl(Get.find()))
    ..put<ListApplyUserRepository>(ListApplyUserRepositoryImpl(Get.find()))
    ..put<TeamDetailController>(TeamDetailController(Get.find(),Get.find()));
  }
}