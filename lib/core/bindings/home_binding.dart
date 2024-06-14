import 'package:footballmanager/domain/repositories/home/create_matches_critetia_repository.dart';
import 'package:get/get.dart';

import '../../domain/repositories/home/list_matches_criteria_repository.dart';
import '../../presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<CreateMatchesCriteriaRepository>(CreateMatchesCriteriaRepositoryImpl(Get.find()))
      ..put<ListMatchesCriteriaRepository>(
          ListMatchesCriteriaRepositoryImpl(Get.find()))
      ..put<HomeController>(HomeController(Get.find(),Get.find()));
  }
}
