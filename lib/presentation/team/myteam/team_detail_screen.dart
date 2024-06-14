import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/presentation/team/components/member_team.dart';
import 'package:footballmanager/presentation/team/myteam/team_detail_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../../core/routing/route_path.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_text_style.dart';

class TeamDetail extends StatefulWidget {
  const TeamDetail({super.key});

  @override
  State<TeamDetail> createState() => _TeamDetailState();
}

class _TeamDetailState extends State<TeamDetail> {
  TeamDetailController teamDetailController = TeamDetailController.to;

  @override
  Widget build(BuildContext context) {
    var itemDetail = teamDetailController.item;
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
                margin:const EdgeInsets.symmetric(horizontal: 8),
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
                                itemDetail.urlImage != null ?
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(

                                      itemDetail.urlImage!),
                                ): CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                  AssetImage(
                                      AppImages.userEmpty),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 32.h,
                      width: 120.w,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child:  GestureDetector(
                          onTap: ()=> {
                            print('############${itemDetail.id!}'),
                            Get.toNamed(Routers.application),
                            teamDetailController.fetchListApplyPending(
                          teamId: itemDetail.id!, status: 'PENDING'),
                            setState(() {

                            }),
                          },
                          child: Container(
                            width: 100.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: AppColors.bgWhiteLow1,
                              borderRadius: BorderRadius.circular(8),
                              border:
                              Border.all(color: AppColors.bgwhiteLow2),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.add_box_outlined,color: Colors.white,),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8),
                                  child: Text(
                                    'Ứng tuyển',
                                    style: AppTextStyles.regular16
                                        .copyWith(color: AppColors.bgWhite),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                    Container(
                      height: 32.h,
                      width: 120.w,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child:  GestureDetector(
                        onTap: ()=> {

                          Get.to(MemberTeam()),
                          teamDetailController.fetchListApplyPending(
                              teamId: itemDetail.id!, status: 'CONFIRMED')
                        },
                        child: Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.bgWhiteLow1,
                            borderRadius: BorderRadius.circular(8),
                            border:
                            Border.all(color: AppColors.bgwhiteLow2),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.account_circle_outlined,color: Colors.white,),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: Text(
                                  'Thành viên',
                                  style: AppTextStyles.regular16
                                      .copyWith(color: AppColors.bgWhite),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 160.w,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child:  GestureDetector(
                        child: Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.bgWhiteLow1,
                            borderRadius: BorderRadius.circular(8),
                            border:
                            Border.all(color: AppColors.bgwhiteLow2),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.access_time_filled,color: Colors.white,),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: Text(
                                  'Lịch sử hoạt động',
                                  style: AppTextStyles.regular16
                                      .copyWith(color: AppColors.bgWhite),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 120.w,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child:  GestureDetector(
                        child: Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.bgWhiteLow1,
                            borderRadius: BorderRadius.circular(8),
                            border:
                            Border.all(color: AppColors.bgwhiteLow2),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.settings,color: Colors.white,),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: Text(
                                  'Tùy chỉnh',
                                  style: AppTextStyles.regular16
                                      .copyWith(color: AppColors.bgWhite),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
