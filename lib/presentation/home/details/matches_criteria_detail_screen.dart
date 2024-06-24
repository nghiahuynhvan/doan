import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/common/enum/e_skillLevel.dart';
import 'package:footballmanager/core/styles/app_images.dart';
import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/domain/serviceable/auth_serviceable.dart';
import 'package:footballmanager/presentation/home/details/matches_criteria_detail_controller.dart';
import 'package:footballmanager/presentation/home/home_controller.dart';
import 'package:get/get.dart';

import '../../../common/enum/e_type_court.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../team/team_controller.dart';

class MatchesCriteriaDetail extends StatefulWidget {
  const MatchesCriteriaDetail({super.key});

  @override
  State<MatchesCriteriaDetail> createState() => _MatchesCriteriaDetailState();
}

class _MatchesCriteriaDetailState extends State<MatchesCriteriaDetail> {
  MatchesCriteriaDetailController matchesCriteriaDetailController =
      MatchesCriteriaDetailController.to;
  HomeController homeController = HomeController.to;
  TeamController teamController = TeamController.to;

  @override
  Widget build(BuildContext context) {
    var itemTeamByUserHome = teamController.itemTeamByUser;
    var itemDetail = matchesCriteriaDetailController.itemDetailHome;
    final authStore = AuthStore.to;
    String? _selectedRole;
    String? _selectedTimeMatch;
    String? _selectedCourtType;
    String? _selectedSkillLevel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Thông tin chi tiết trận đấu sảnh chờ',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: itemDetail.team!.urlImage != null
                              ? Image.network(
                                  itemDetail.team!.urlImage!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(AppImages.userEmpty),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              'ĐỘI BÓNG',
                              style: AppTextStyles.bold16
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              itemDetail.team!.name,
                              style: AppTextStyles.bold16
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              itemDetail.team!.region!,
                              style: AppTextStyles.bold16.copyWith(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Container(
                            width: 130.w,
                            child: Text(
                              itemDetail.team!.playingStyle!,
                              style: AppTextStyles.bold16.copyWith(
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: _itemDetail(
                              'Thời gian đấu', itemDetail.timeMatch.toString(),),
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                        ),
                       Container(
                         margin: EdgeInsets.symmetric(vertical: 4.h),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start
                           ,
                           children: [
                             Text(
                               'Chọn đội bóng',
                               style: AppTextStyles.bold16
                                   .copyWith(color: Colors.black),
                             ),
                             Container(
                               child: DropdownButtonFormField<String>(
                                 value: _selectedRole,
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     _selectedRole = newValue;
                                     homeController.index = itemTeamByUserHome.value!
                                         .indexWhere((e) => e.name == _selectedRole)
                                         .obs;
                                     print('##${homeController.index}');
                                   });
                                 },
                                 items: teamController.teamNames
                                     .map<DropdownMenuItem<String>>((String role) {
                                   return DropdownMenuItem<String>(
                                     value: role,
                                     child: Text(role),
                                   );
                                 }).toList(),
                                 decoration: const InputDecoration(
                                   labelText: '',
                                   border: OutlineInputBorder(),
                                 ),
                                 dropdownColor: Colors.blue[50],
                                 iconEnabledColor: Colors.blue,
                                 iconDisabledColor: Colors.grey,
                                 style: TextStyle(
                                   color: Colors.blue[800],
                                   fontSize: 16,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thể loại sân',
                              style: AppTextStyles.bold16
                                  .copyWith(color: Colors.black),
                            ),
                            Container(
                              child: DropdownButtonFormField<String>(
                                value: _selectedCourtType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCourtType = newValue;
                                    matchesCriteriaDetailController
                                        .selectedCourtType
                                        .value = _selectedCourtType!;
                                  });
                                },
                                items: itemDetail.courtTypeList != null
                                    ? itemDetail.courtTypeList!
                                    .map<DropdownMenuItem<String>>(
                                        (String role) {
                                      return DropdownMenuItem<String>(
                                        value: role,
                                        child: Text(role),
                                      );
                                    }).toList()
                                    : [],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trình độ',
                              style: AppTextStyles.bold16
                                  .copyWith(color: Colors.black),
                            ),
                            Container(
                              child: DropdownButtonFormField<String>(
                                value: _selectedSkillLevel,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedSkillLevel = newValue;
                                    matchesCriteriaDetailController
                                        .selectedSkillLevel
                                        .value = _selectedSkillLevel!;
                                  });
                                },
                                items: itemDetail.skillLevelList!
                                    .map<DropdownMenuItem<String>>((String role) {
                                  return DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thời gian trận',
                                style: AppTextStyles.bold16
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                child: DropdownButtonFormField<String>(
                                  value: _selectedTimeMatch,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedTimeMatch = newValue;
                                      matchesCriteriaDetailController
                                          .selectedTimeMatch
                                          .value = _selectedTimeMatch!;
                                    });
                                  },
                                  items: itemDetail.timeMatchList!
                                      .map<DropdownMenuItem<String>>((String role) {
                                    return DropdownMenuItem<String>(
                                      value: role,
                                      child: Text(role),
                                    );
                                  }).toList(),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  dropdownColor: Colors.white,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                       Container(
                         margin: EdgeInsets.symmetric(vertical: 4.h),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               'Địa chỉ',
                               style: AppTextStyles.bold16
                                   .copyWith(color: Colors.black),
                             ),
                             Container(
                               child: DropdownButtonFormField<String>(
                                 value: _selectedRole,
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     _selectedRole = newValue;
                                     matchesCriteriaDetailController
                                         .selectedAddress.value = _selectedRole!;
                                   });
                                 },
                                 items: matchesCriteriaDetailController
                                     .getAddressesAsList(itemDetail.addressList!)
                                     .map<DropdownMenuItem<String>>((String role) {
                                   return DropdownMenuItem<String>(
                                     value: role,
                                     child: Text(role),
                                   );
                                 }).toList(),
                                 decoration: const InputDecoration(
                                   border: OutlineInputBorder(),
                                 ),
                                 dropdownColor: Colors.white,
                                 iconEnabledColor: Colors.white,
                                 iconDisabledColor: Colors.white,
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 16,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                        itemDetail.team?.ownerId
                            != authStore.idUser ?
                        itemDetail.status?.title == "PENDING" ?
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 24.h),
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.buttonBlue,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.buttonBlue.withOpacity(0.3),
                                offset: Offset(0, 8.h),
                                blurRadius: 16.r,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              var itemHome = itemTeamByUserHome
                                  .value![homeController.index.value];
                              matchesCriteriaDetailController.createMatches(
                                MatchModel(
                                    homeTeam: TeamByUserModel(
                                        id: itemDetail.team!.id),
                                    awayTeam: TeamByUserModel(id: itemHome.id),
                                    playingTime: itemDetail.timeMatch,
                                    matchDate: matchesCriteriaDetailController
                                        .selectedTimeMatch.value,
                                    status: "SCHEDULED",
                                    typeCourt: matchesCriteriaDetailController
                                        .selectedCourtType.value,
                                    skillLevel: matchesCriteriaDetailController
                                        .selectedSkillLevel.value,
                                    address: matchesCriteriaDetailController
                                        .selectedAddress.value,
                                    matchCriterialId: itemDetail.id),
                              );
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: AppTextStyles.bold16.copyWith(
                                color: Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.r),
                              ),
                            ),
                            child: Text('Ghép đội'),
                          ),
                        ) : Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 24.h),
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.btGrey800,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.btGrey800.withOpacity(0.3),
                                offset: Offset(0, 8.h),
                                blurRadius: 16.r,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: AppTextStyles.bold16.copyWith(
                                color: Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.r),
                              ),
                            ),
                            child: Text('Đã ghép đội'),
                          ),
                        ): Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_itemDetail(String lable, String name) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lable,
          style: AppTextStyles.bold16.copyWith(color: Colors.black),
        ),
        const Spacer(flex: 1),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(name,
                style: AppTextStyles.regular18.copyWith(color: Colors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    ),
  );
}
