import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/domain/serviceable/auth_serviceable.dart';
import 'package:footballmanager/presentation/profile/profile_controller.dart';
import 'package:footballmanager/presentation/team/components/request_apply_team.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_details_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/models/team/member_team_model.dart';

class DiscoveryDetail extends StatefulWidget {
  const DiscoveryDetail({super.key});

  @override
  State<DiscoveryDetail> createState() => _DiscoveryDetailState();
}

class _DiscoveryDetailState extends State<DiscoveryDetail> {
  DiscoveryController discoveryController = DiscoveryController.to;
  final authStore = AuthStore.to;

  @override
  Widget build(BuildContext context) {
    var itemDetail = discoveryController.item;
    bool _isButtonClicked = false;
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                'Thông tin đội bóng',
                style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
              ),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.bgWhiteLow1,
          elevation: 0,
        ),
        // backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'ĐỘI ĐẤU',
                                      style: AppTextStyles.regular18
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      itemDetail.name,
                                      style: AppTextStyles.bold18
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(

                                      itemDetail.urlImage!),
                                ),
                              ],
                            ),
                          ),
                          _itemDetail('Người liên hệ', '-'),
                          _itemDetail(
                              'Số điên thoại', itemDetail.contactInformation??"-"),
                          _itemDetail('Trình độ', itemDetail.skill??"-"),
                           _itemDetail('Danh hiệu', itemDetail.achievements??"-"),
                          _itemDetail('Mô tả', itemDetail.description??"-"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              authStore.idTeam == ""?
              GestureDetector(
                onTap: () {
                  {
                    var itemUser =discoveryController.userDetail.value;
                    discoveryController.requestApply(MemberData(
                      teamId: itemDetail.id!,
                      member: MemberInfo(
                          createAt: itemUser?.createdAt,
                          updateAt: itemUser?.updatedAt,
                          id: discoveryController.authStoreService.idUser,
                          phoneNumber: itemUser?.phoneNumber,
                          fullName: itemUser?.fullName,
                          nickName: itemUser?.nickName,
                          favoritePosition: itemUser?.favoritePosition,
                          description:
                          itemUser?.description,
                          gender: 'FEMALE',
                          birthday: itemUser?.birthday,
                          signInMethod: "GOOGLE",
                          status: 'ACTIVE',
                          avatarUrl:
                          itemUser?.avatarUrl,
                          username: itemUser?.username,
                          email: itemUser?.email,
                          verifyEmail: true),
                    ));
                  }
                  setState(() {
                    _isButtonClicked = !_isButtonClicked;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: _isButtonClicked ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50.h,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'THAM GIA',
                      style: AppTextStyles.bold18.copyWith(
                        color:  Colors.blue,
                      ),
                    ),
                  ),
                ),
              ): Container(),
            ],
          ),
        ),
      ),
    );
  }
}

_itemDetail(String lable, String name) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.appbarWhiteLow,
          width: 1.0,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lable,
          style: AppTextStyles.regular18.copyWith(color: Colors.white),
        ),
        const Spacer(flex: 1),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(name,
                style: AppTextStyles.regular18.copyWith(color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    ),
  );
}
