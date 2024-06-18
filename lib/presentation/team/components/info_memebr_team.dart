import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/domain/serviceable/auth_serviceable.dart';
import 'package:footballmanager/presentation/team/myteam/team_detail_controller.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../shared/widget/app_bg_body_view.dart';

class InforMemberTeam extends StatefulWidget {
  const InforMemberTeam({super.key});

  @override
  State<InforMemberTeam> createState() => _InforMemberTeamState();
}

class _InforMemberTeamState extends State<InforMemberTeam> {
  final authStore = AuthStore.to;
  TeamDetailController teamDetailController = TeamDetailController.to;

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
        child: Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Thông tin chi tiết thành viên',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.appbarWhiteLow,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => {},
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.bgWhite.withOpacity(0.1),
                  ),
                  child: Obx(
                    () => teamDetailController.userDetail.value != null
                        ? Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: teamDetailController
                                            .userDetail.value!.avatarUrl !=
                                        null
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            teamDetailController
                                                .userDetail.value!.avatarUrl!),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage(AppImages.userEmpty),
                                      ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 4),
                                child: Column(
                                  children: [
                                    Text(
                                      teamDetailController
                                          .userDetail.value!.fullName!,
                                      style: AppTextStyles.regular18
                                          .copyWith(color: AppColors.bgWhite),
                                    ),
                                    Text(
                                      teamDetailController.userDetail.value!
                                              .favoritePosition ??
                                          '',
                                      style: AppTextStyles.regular16.copyWith(
                                          color: AppColors.bgWhiteLow5),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgWhiteLow1,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Obx(
                    () => teamDetailController.userDetail.value != null
                        ? Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Text(
                                      'THÔNG TIN CÁ NHÂN',
                                      style: AppTextStyles.regular16
                                          .copyWith(color: AppColors.bgWhite),
                                    ),
                                  ),
                                ],
                              ),
                              if (teamDetailController.userDetail.value != null)
                                _itemInformation(
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Icon(
                                        Icons.account_box_outlined,
                                        color: AppColors.bgWhite,
                                        size: 24,
                                      ),
                                    ),
                                    teamDetailController
                                            .userDetail.value!.email ??
                                        ''),
                              if (teamDetailController.userDetail.value != null)
                                _itemInformation(
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Icon(
                                        Icons.access_time,
                                        color: AppColors.bgWhite,
                                        size: 24,
                                      ),
                                    ),
                                    teamDetailController
                                        .userDetail.value!.birthday
                                        .toString()),
                              _itemInformation(
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Icon(
                                      Icons.phone,
                                      color: AppColors.bgWhite,
                                      size: 24,
                                    ),
                                  ),
                                  teamDetailController
                                          .userDetail.value!.phoneNumber ??
                                      ''),
                              _itemInformation(
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Icon(
                                      Icons.favorite,
                                      color: AppColors.bgWhite,
                                      size: 24,
                                    ),
                                  ),
                                  teamDetailController
                                          .userDetail.value!.favoritePosition ??
                                      ''),
                              _itemInformation(
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Icon(
                                      Icons.description,
                                      color: AppColors.bgWhite,
                                      size: 24,
                                    ),
                                  ),
                                  teamDetailController
                                          .userDetail.value!.description ??
                                      ''),
                              teamDetailController.item.ownerId == authStore.idUser
                                  ? GestureDetector(
                                onTap: () => {
                                  teamDetailController.deleteMember(
                                      teamDetailController.userDetail.value!.id!),
                                },
                                child: Container(
                                  height: 40.h,
                                  width: double.infinity,
                                  margin:
                                  const EdgeInsets.only(top: 16, left: 16, right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.bgWhite.withOpacity(0.1),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                        const EdgeInsets.symmetric(horizontal: 16),
                                        child: Text(
                                          'Xóa thành viên',
                                          style: AppTextStyles.regular18
                                              .copyWith(color: AppColors.bgWhite),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          )
                        : Container(),
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    ));
  }
}

_itemInformation(Widget widget, String text) {
  return Container(
    child: Row(
      children: [
        widget,
        Text(
          text,
          style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
        ),
      ],
    ),
  );
}
