import 'package:footballmanager/domain/repositories/home/list_matches_by_team_repository.dart';
import 'package:footballmanager/presentation/match/match_controller.dart';
import 'package:get/get.dart';

class MatchBinding extends Bindings {
  @override
  void dependencies()
  { Get
    ..put<ListMatchesByTeamRepository>(ListMatchesByTeamRepositoryImpl(Get.find()))
    ..put<MatchController>(MatchController(Get.find()));
  }
}