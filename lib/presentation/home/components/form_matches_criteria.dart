import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/common/enum/e_status.dart';
import 'package:footballmanager/common/enum/e_status_apply.dart';
import 'package:footballmanager/domain/models/home/address_model.dart';
import 'package:footballmanager/domain/models/home/matches_criteria_model.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/presentation/home/home_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import '../../../common/enum/e_type_court.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/serviceable/auth_serviceable.dart';
import '../../team/team_controller.dart';

class FormMatchesCriteria extends StatefulWidget {
  const FormMatchesCriteria({super.key});

  @override
  State<FormMatchesCriteria> createState() => _FormMatchesCriteriaState();
}

class _FormMatchesCriteriaState extends State<FormMatchesCriteria> {
  HomeController homeController = HomeController.to;
  TeamController teamController = TeamController.to;
  final authStoreService = AuthStore.to;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _timematchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var itemTeamByUser = teamController.itemTeamByUser;
    String? _selectedRole;

    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Tạo sảnh chờ cho trận đấu',
              style: AppTextStyles.bold19.copyWith(color: AppColors.bgBlack),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.bgWhite,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Obx(
                            () => Container(
                              child: DropdownButtonFormField<String>(
                                value: _selectedRole,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedRole = newValue;
                                    homeController.index = itemTeamByUser.value!
                                        .indexWhere(
                                            (e) => e.name == _selectedRole)
                                        .obs;
                                    print('##${homeController.index}');
                                  });
                                },
                                items: teamController.teamNames
                                    .map<DropdownMenuItem<String>>(
                                        (String role) {
                                  return DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  labelText: 'Chọn đội bóng',
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
                          ),
                          Text(
                            'Thể loại sân',
                            style: AppTextStyles.regular18
                                .copyWith(color: Colors.black),
                          ),
                         Obx(()=>  GFMultiSelect(
                           items: homeController.allCourtTypes.toList(),
                           onSelect: (value) {
                             homeController.A.clear();
                             homeController.A.addAll([...value]);
                           },
                           dropdownTitleTileText: '',
                           dropdownTitleTileMargin: const EdgeInsets.symmetric(
                               vertical: 1, horizontal: 1),
                           dropdownTitleTilePadding: const EdgeInsets.all(0),
                           dropdownUnderlineBorder: const BorderSide(
                               color: Colors.transparent, width: 2),
                           dropdownTitleTileBorder:
                           Border.all(color: Colors.grey, width: 1),
                           dropdownTitleTileBorderRadius:
                           BorderRadius.circular(5),
                           expandedIcon: const Icon(
                             Icons.keyboard_arrow_down,
                             color: Colors.black54,
                           ),
                           collapsedIcon: const Icon(
                             Icons.keyboard_arrow_up,
                             color: Colors.black54,
                           ),
                           submitButton: GestureDetector(
                             onTap: () {
                               homeController.addAllCourtTypeByUser();
                               print('###${homeController.allCourTypesPicker}');
                             },
                             child: const Text('OK'),
                           ),
                           dropdownTitleTileTextStyle: AppTextStyles.bold13,
                           padding: const EdgeInsets.all(6),
                           margin: const EdgeInsets.all(6),
                           activeBgColor: Colors.green.withOpacity(0.5),
                           inactiveBorderColor: Colors.grey,
                         ),),
                          Container(
                            child: Text(
                              'Thời gian trận đấu',
                              style: AppTextStyles.regular18
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          TextField(
                            style: AppTextStyles.regular18
                                .copyWith(color: Colors.black),
                            controller: _timematchController,
                            decoration: InputDecoration(
                              hintText: ' ',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(2),
                            ),
                            onChanged: (value) {},
                          ),
                          Obx(
                            () => Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(
                                        context,
                                        dateFormat: 'dd MMMM yyyy HH:mm',
                                        initialDateTime: DateTime.now(),
                                        minDateTime: DateTime(2000),
                                        maxDateTime: DateTime(3000),
                                        onMonthChangeStartWithFirstDate: true,
                                        onConfirm: (dateTime, _) {
                                          final selectedDate =
                                              DateFormat('dd-MM-yyyy HH:mm')
                                                  .format(dateTime);
                                          homeController.listTimeMatch
                                              .add(selectedDate);
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Thời gian bắt đầu : ',
                                      style: AppTextStyles.regular18
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          )),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            homeController.listTimeMatch.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            homeController.listTimeMatch[index],
                                            style: AppTextStyles.regular18
                                                .copyWith(color: Colors.black),
                                            textAlign: TextAlign.right,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Obx(() => Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          dateFormat: 'dd MMMM yyyy HH:mm',
                                          initialDateTime: DateTime.now(),
                                          minDateTime: DateTime(2000),
                                          maxDateTime: DateTime(3000),
                                          onMonthChangeStartWithFirstDate: true,
                                          onConfirm: (dateTime, _) {
                                            final selectedDate =
                                                DateFormat('dd-MM-yyyy HH:mm')
                                                    .format(dateTime);
                                            homeController.endTime.value =
                                                selectedDate;
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Thời gian hết hạn : ',
                                        style: AppTextStyles.regular18
                                            .copyWith(color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          homeController.endTime.value,
                                          style: AppTextStyles.regular18
                                              .copyWith(color: Colors.black),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mô tả :     ',
                                    style: AppTextStyles.regular18
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _descriptionController,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        hintText: 'Nhập mô tả ',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.all(4),
                                      ),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 16.h),
                            width: double.infinity,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.buttonBlue,
                              borderRadius: BorderRadius.circular(28.r),
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
                                var item = itemTeamByUser
                                    .value![homeController.index.value];
                                homeController.createMatchesCriteria(
                                    MatchCriteriaModel(
                                        userCreateId: authStoreService.idUser,
                                        team: TeamByUserModel(
                                            id: item.id,
                                            ownerId: item.ownerId,
                                            teamName: item.teamName,
                                            shortname: item.shortname,
                                            description: item.description,
                                            region: item.region,
                                            district: item.district,
                                            city: item.city,
                                            status: item.status,
                                            code: item.code,
                                            urlImage: item.urlImage,
                                            ruleTeam: item.ruleTeam,
                                            playingStyle: item.playingStyle,
                                            skillLevel: item.skillLevel,
                                            contactInformation:
                                                item.contactInformation,
                                            achievements: item.achievements),
                                        addressList: [
                                          AddressModel(
                                              region: 'so 8',
                                              district: 'Sơn Trà',
                                              city: 'Đà Nẵng'),
                                        ],
                                        skillLevelList: [
                                          'BEGINNER',
                                        ],
                                        courtTypeList: homeController.allCourTypesPicker.value,
                                        expiryTime:
                                            homeController.endTime.value,
                                        description: 'abc',
                                        status: EStatusApply.pending,
                                        timeMatch: int.parse(
                                            _timematchController.text),
                                        timeMatchList:
                                            homeController.listTimeMatch,
                                        isAutoMap: true));
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
                              child: Text('Tạo đội'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
          style: AppTextStyles.regular18.copyWith(color: Colors.black),
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
