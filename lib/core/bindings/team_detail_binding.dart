import 'package:footballmanager/domain/repositories/home/list_matches_by_team_repository.dart';
import 'package:footballmanager/presentation/team/myteam/team_detail_controller.dart';
import 'package:get/get.dart';

import '../../domain/repositories/team/list_apply_user_repository.dart';
import '../../domain/repositories/team/update_member_team_repository.dart';
import '../../domain/repositories/team/update_status_team.dart';
import '../../domain/repositories/user/user_detail_repository.dart';

class TeamDetailBinding extends Bindings {
  @override
  void dependencies()
  {
    Get
    ..put<ListMatchesByTeamRepository>(ListMatchesByTeamRepositoryImpl(Get.find()))
    ..put<UserDetailRepository>(UserDetailRepositoryImpl(Get.find()))
    ..put<UpdateStatusTeamRepository>(UpdateStatusTeamRepositoryImpl(Get.find()))
      ..put<updateMemberTeamRepository>(updateMemberTeamRepositoryImpl(Get.find()))
    ..put<ListApplyUserRepository>(ListApplyUserRepositoryImpl(Get.find()))
    ..put<TeamDetailController>(TeamDetailController(Get.find(),Get.find(),Get.find(),Get.find(),Get.find()));
  }
}