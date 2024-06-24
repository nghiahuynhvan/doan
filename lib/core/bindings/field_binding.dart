import 'package:footballmanager/domain/repositories/tournament/tournament_repository.dart';
import 'package:get/get.dart';

import '../../presentation/field/field_controller.dart';

class FieldBinding extends Bindings {
  @override
  void dependencies()
  {Get
  ..put<TournamentRepository>(TournamentRepositoryImpl(Get.find()))
    ..put<FieldController>(FieldController(Get.find()));
  }

}