import 'package:get/get.dart';

import '../../domain/repositories/home/create_match_repository.dart';
import '../../presentation/home/details/matches_criteria_detail_controller.dart';

class MatchesCriteriaBinding extends Bindings {

  @override
  void dependencies()
  {
    Get
    ..put<CreateMatchRepository>(CreateMatchRepositoryImpl(Get.find()))
    ..put<MatchesCriteriaDetailController>(MatchesCriteriaDetailController(Get.find()));
  }
}