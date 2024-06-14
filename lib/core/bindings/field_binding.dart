import 'package:get/get.dart';

import '../../presentation/field/field_controller.dart';

class FieldBinding extends Bindings {
  @override
  void dependencies()
  {
    Get.put<FieldController>(FieldController());
  }

}