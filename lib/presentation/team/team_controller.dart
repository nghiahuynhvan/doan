import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/pref_constants.dart';
import '../../common/services/app_status.dart';
import '../../domain/models/address/address_city_model.dart';
import '../../domain/models/address/district_model.dart';
import '../../domain/models/team/team_by_user_model.dart';
import '../../domain/repositories/address/address_city_repository.dart';
import '../../domain/repositories/address/district_repository.dart';
import '../../domain/repositories/team/create_team_repository.dart';
import '../../domain/repositories/team/team_all_repository.dart';
import '../../domain/repositories/team/team_by_user_repository.dart';
import '../../domain/serviceable/auth_serviceable.dart';

class TeamController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamController(this.teamByUserRepository, this.teamAllRepository,
      this.createTeamRepository, this.addressCityRepository, this.districtRepository);

  final authStoreService = AuthStore.to;


  static TeamController get to => Get.find();
  late TabController tabController;
  final RxList<String> teamNames = RxList<String>([]);
  late CreateTeamRepository createTeamRepository;
  final storage = Get.find<SharedPreferences>();

  late AddressCityRepository addressCityRepository;

  late DistrictRepository districtRepository;

  var itemAddress = Rxn<List<AddressCityModel>>();
  // var itemDistrict = Rxn<List<DistrictModel>>();
  RxList<DistrictModel> itemDistrict = <DistrictModel>[].obs;

  late RxString seletedSkill = ''.obs;

  Rx<AddressCityModel?> selectedCity = Rx<AddressCityModel?>(null);
  Rx<DistrictModel?> selectedDistrict = Rx<DistrictModel?>(null);

  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    fetchListTeamByUser();
    fetchListAll();
    tabController = TabController(length: 2, vsync: this);
    getAddress();
    getDistrict(6733);
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

  Future<void> getAddress() async {
    final result = await addressCityRepository.getCity();
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemAddress.value = right;
    });
  }
  Future<void> getDistrict(int id)async {
    final result = await districtRepository.getDistrictById(id);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      selectedDistrict.value = null;
      itemDistrict.value!.clear();
      itemDistrict.value = right;
    });

  }

// .where((item) => item.status == 'active').toList();
}
