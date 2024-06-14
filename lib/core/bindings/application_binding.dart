import 'package:footballmanager/domain/repositories/team/list_apply_user_repository.dart';
import 'package:footballmanager/presentation/team/application_controller.dart';
import 'package:get/get.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApplicationController>(ApplicationController());
  }
}
