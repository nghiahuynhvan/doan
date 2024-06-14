import 'package:footballmanager/domain/repositories/user/user_detail_repository.dart';
import 'package:get/get.dart';

import '../../presentation/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies()
  {Get
    ..put<UserDetailRepository>(UserDetailRepositoryImpl(Get.find()))
    ..put<ProfileController>(ProfileController(Get.find()));
  }
}