import 'package:footballmanager/domain/repositories/team/user_apply_repository.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_details_controller.dart';
import 'package:get/get.dart';

import '../../domain/repositories/team/list_apply_user_repository.dart';
import '../../domain/repositories/team/update_member_team_repository.dart';

class DiscoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get

      ..put<UserApplyRepository>(UserApplyRepositoryImpl(Get.find()))
      ..put<DiscoveryController>(DiscoveryController(Get.find()));
  }
}