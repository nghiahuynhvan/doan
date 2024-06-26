import 'package:flutter/material.dart';
import 'package:footballmanager/domain/repositories/home/list_matches_by_team_repository.dart';
import 'package:footballmanager/domain/serviceable/auth_serviceable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/pref_constants.dart';
import '../../domain/models/home/match_model.dart';

class MatchController extends GetxController with GetSingleTickerProviderStateMixin {
  MatchController(this._listMatchesByTeamRepository);
  late TabController tabController1;

  static MatchController get to => Get.find();
  late ListMatchesByTeamRepository _listMatchesByTeamRepository;
  final authStore = AuthStore.to;
  var itemMatchesByTeam = Rxn<List<MatchModel>>();
  var tiemMatchesAll = Rxn<List<MatchModel>>();
  // final storage = Get.find<SharedPreferences>();

  @override
  void onInit() {
    getMatchesByTeam();
    tabController1 = TabController(length: 2, vsync: this);
    super.onInit();

  }

  Future<void> getMatchesByTeam() async {
    final result = await _listMatchesByTeamRepository.getMachesByTeam(
        teamId: authStore.idTeam);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemMatchesByTeam.value = right;
    });
  }
  Future<void> getMatchesAll() async {
    final result = await _listMatchesByTeamRepository.getMachesAll(
        );
    result.fold((left) => print("error ${left.toString()}"), (right) {
      tiemMatchesAll.value = right;
    });
  }
}
