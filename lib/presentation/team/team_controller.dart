import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/pref_constants.dart';
import '../../common/services/app_status.dart';
import '../../domain/models/team/team_by_user_model.dart';
import '../../domain/repositories/team/create_team_repository.dart';
import '../../domain/repositories/team/team_all_repository.dart';
import '../../domain/repositories/team/team_by_user_repository.dart';
import '../../domain/serviceable/auth_serviceable.dart';

class TeamController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamController(this.teamByUserRepository, this.teamAllRepository,
      this.createTeamRepository);

  final authStoreService = AuthStore.to;

  static TeamController get to => Get.find();
  late TabController tabController;
  final RxList<String> teamNames = RxList<String>([]);
  late CreateTeamRepository createTeamRepository;
  final storage = Get.find<SharedPreferences>();

  late RxString seletedSkill = ''.obs;

  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    fetchListTeamByUser();
    fetchListAll();
    tabController = TabController(length: 2, vsync: this);
  }

  late RxInt numberTeam = 0.obs;

  TeamByUserRepository teamByUserRepository;
  TeamAllRepository teamAllRepository;

  var itemTeamByUser = Rxn<List<TeamByUserModel>>();

  var itemTeamAll = Rxn<List<TeamByUserModel>>();

  Future<void> fetchListTeamByUser() async {
    if (itemTeamByUser.value != null) {
      itemTeamByUser.value!.clear();
    }
    final result =
        await teamByUserRepository.getTeamByUserId(id: authStoreService.idUser);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemTeamByUser.value = right;
      storage.setString(PrefsConstants.idTeam, itemTeamByUser.value![0].id!);
      print('###${storage.setString(PrefsConstants.idTeam, itemTeamByUser.value![0].id!)}');
      authStoreService.getIdTeam();
      itemTeamByUser.value?.forEach((teamModel) {
        teamNames.add(teamModel.name);
        print('######$teamNames}');
      });
    });
  }

  Future<void> fetchListAll() async {
    AppStatus.dismissLoading();
    final result = await teamAllRepository.getTeamAll();
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemTeamAll.value =
          right.where((item) => item.statusTeam == 'APPLY').toList();
      ;
      print("#######$itemTeamByUser.value");
    });
  }

  void createTeam(TeamByUserModel data) async {
    //valid
    final result = await createTeamRepository.createTeam(data);
    // results || error
    // Handle back
    Get.back(result: "result");
  }

// .where((item) => item.status == 'active').toList();
}
