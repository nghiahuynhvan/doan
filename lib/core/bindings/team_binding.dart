import 'package:flutter/material.dart';
import 'package:footballmanager/domain/repositories/address/district_repository.dart';
import 'package:footballmanager/presentation/team/myteam/list_my_team_controller.dart';
import 'package:get/get.dart';

import '../../data/remote/team_all_remote_data_source.dart';
import '../../data/remote/team_by_user_remote_data_source.dart';
import '../../domain/repositories/address/address_city_repository.dart';
import '../../domain/repositories/team/create_team_repository.dart';
import '../../domain/repositories/team/team_all_repository.dart';
import '../../domain/repositories/team/team_by_user_repository.dart';
import '../../presentation/team/team_controller.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<AddressCityRepository>(AddressCityRepositoryImpl(Get.find()))
      ..put<DistrictRepository>(DistrictRepositoryImpl(Get.find()))
      ..put<CreateTeamRepository>(CreateTeamRepositoryImpl(Get.find()))
      ..put<TeamByUserRemoteDataSource>(
          TeamByUserRemoteDataSourceImpl(Get.find()))
      ..put<TeamByUserRepository>(TeamByUserRepositoryImpl(Get.find()))
      ..put<TeamAllRemoteDataSource>(TeamAllRemoteDataSourceImpl(Get.find()))
      ..put<TeamAllRepository>(TeamAllRepositoryImpl(Get.find()))
      ..put<TeamController>(TeamController(Get.find(), Get.find(), Get.find(),Get.find(),Get.find()));
  }
}
