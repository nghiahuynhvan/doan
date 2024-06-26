import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/domain/serviceable/auth_serviceable.dart';
import 'package:footballmanager/presentation/field/components/schedule_tour_screen.dart';
import 'package:footballmanager/presentation/field/components/tour_table_screen.dart';
import 'package:footballmanager/presentation/field/components/tour_team_screen.dart';
import 'package:footballmanager/presentation/field/field_controller.dart';
import 'package:get/get.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_common_title.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/app_text_style.dart';
import '../../domain/models/tournament/tour_team_model.dart';
import '../../shared/widget/app_bg_body_view.dart';
import '../../shared/widget/dialog/app_custom_dialog.dart';
import '../team/team_controller.dart';

class TourDetails extends StatefulWidget {
  const TourDetails({super.key});

  @override
  State<TourDetails> createState() => _TourDetailsState();
}

class _TourDetailsState extends State<TourDetails> {
  FieldController tourDetailsController = FieldController.to;
  final authStore = AuthStore.to;

  @override
  Widget build(BuildContext context) {
    var itemTour = tourDetailsController.tourDetail.value!.tournament!;
    var itemTeamTour =
        tourDetailsController.tourDetail.value!.tournamentTeamConfirm!;
    var itemScheldule = tourDetailsController.tourDetail.value!.matchFootballs!;
    var itemTable = tourDetailsController.tourDetail.value!.groupTeamDTOList!;
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                'Thông tin giải đấu',
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
                margin: const EdgeInsets.symmetric(horizontal: 8),
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
                                      'Giải đấu',
                                      style: AppTextStyles.regular18
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      itemTour.name!,
                                      style: AppTextStyles.bold18
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                                itemTour.imageList![0] != null
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            itemTour.imageList![0]),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage(AppImages.userEmpty),
                                      ),
                              ],
                            ),
                          ),
                          _itemDetail('Hình thức',  AppCommonTitle().getForm(itemTour.type!) ?? "-"),
                          _itemDetail(
                              'Ban tổ chức', itemTour.personContact ?? "-"),
                          _itemDetail('Địa điểm', itemTour.address ?? "-"),
                          _itemDetail(
                              'Số điện thoại', itemTour.phoneContact ?? "-"),
                          _itemDetail('Trình độ',AppCommonTitle().titleSkill(itemTour.levelRequire!)  ?? "-"),
                          _itemDetail('Bắt đầu', itemTour.startTime ?? "-"),
                          _itemDetail('Kết thúc', itemTour.endTime ?? "-"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  'QUẢN LÝ GIẢI ĐẤU',
                  style: AppTextStyles.bold16.copyWith(color: Colors.white),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: GestureDetector(
                        onTap: () =>
                            {Get.to(TourTeam(), arguments: itemTeamTour)},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.bgWhiteLow1,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.bgwhiteLow2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.sports_soccer,
                                color: Colors.white,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Đội bóng',
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: GestureDetector(
                        onTap: () => {
                          Get.to(Schedule(), arguments: itemScheldule),
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.bgWhiteLow1,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.bgwhiteLow2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.schedule,
                                color: Colors.white,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Lịch đấu',
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: GestureDetector(
                        onTap: () async {
                          Get.to(TableTour(), arguments: itemTable);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.bgWhiteLow1,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.bgwhiteLow2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: Colors.white,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Bảng đấu',
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
              ),
              itemTour.status == "IN_PROGRESS"?
              GestureDetector(
                onTap: () {
                  {
                  tourDetailsController.registerTour(TourTeamModel(
                    teamId: authStore.idTeam,
                    tournamentId: itemTour.id,
                  ));
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AppCustomDialog(
                          title:
                          'Đã gửi đăng kí',
                          confirmButton: AppDialogButton(
                            text: 'Quay lại',
                            onPressed: () async {
                              Get.back();
                            },
                          ),
                        );
                      },
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color:  Colors.blueAccent ,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 30.h,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'THAM GIA GIẢI ĐẤU',
                      style: AppTextStyles.bold16.copyWith(
                        color:  Colors.white,
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
    padding: EdgeInsets.symmetric(vertical: 8.h),
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
          style: AppTextStyles.regular14.copyWith(color: Colors.white),
        ),
        const Spacer(flex: 1),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(name,
                style: AppTextStyles.regular14.copyWith(color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    ),
  );
}
