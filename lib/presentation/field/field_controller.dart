import 'package:footballmanager/domain/models/tournament/tour_detail_model.dart';
import 'package:footballmanager/domain/models/tournament/tour_team_model.dart';
import 'package:footballmanager/domain/models/tournament/tournament_model.dart';
import 'package:get/get.dart';

import '../../domain/repositories/tournament/tournament_repository.dart';

class FieldController extends GetxController {
  static FieldController get to => Get.find();
   FieldController(this._tournamentRepository);
  late TournamentRepository _tournamentRepository;
  var tourDetail = Rxn<TourDetailModel>();

  var itemTournament = Rxn<List<TournamentModel>>();

  @override
  void onInit()

  {
    GetTournament();
super.onInit();
  }
  Future<void> GetTournament() async {
    final result = await _tournamentRepository.getTournament();
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemTournament.value = right;
    });
  }

  Future<void> getTourDetails(String id) async {
    final result = await _tournamentRepository.getTourDetails(id);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      tourDetail.value = right;
    });
  }
  Future<void> registerTour(TourTeamModel data) async
  {
    final result = await _tournamentRepository.registerTour(data);
  }


  String getTitleVn(String title) {
    switch (title) {
      case "IN_PROGRESS":
        return "Đang diễn ra";
      default:
        return title;
    }
  }
}