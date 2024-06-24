import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/presentation/field/components/schedule_tour_screen.dart';
import 'package:footballmanager/presentation/field/components/tour_table_screen.dart';
import 'package:footballmanager/presentation/field/components/tour_team_screen.dart';
import 'package:footballmanager/presentation/field/field_controller.dart';
import 'package:get/get.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';

class TourDetails extends StatefulWidget {
  const TourDetails({super.key});

  @override
  State<TourDetails> createState() => _TourDetailsState();
}

class _TourDetailsState extends State<TourDetails> {
  FieldController tourDetailsController = FieldController.to;
  @override
  Widget build(BuildContext context) {
    var itemTour = tourDetailsController.tourDetail.value!.tournament!;
    var itemTeamTour = tourDetailsController.tourDetail.value!.tournamentTeamConfirm!;
    var itemScheldule= tourDetailsController.tourDetail.value!.matchFootballs!;
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
                                itemTour.imageList![0] != null ?
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(

                                      itemTour.imageList![0]),
                                ): CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                  AssetImage(
                                      AppImages.userEmpty),
                                ),
                              ],
                            ),
                          ),
                          _itemDetail('Hình thức', itemTour.type?? "-"),
                          _itemDetail(
                              'Ban tổ chức', itemTour.personContact??"-"),
                          _itemDetail('Địa điểm', itemTour.address??"-"),
                          _itemDetail('Số điện thoại', itemTour.phoneContact??"-"),
                          _itemDetail('Trình độ', itemTour.levelRequire??"-"),
                          _itemDetail('Bắt đầu', itemTour.startTime??"-"),
                          _itemDetail('Kết thúc', itemTour.endTime??"-"),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child:
                Text('QUẢN LÝ GIẢI ĐẤU', style: AppTextStyles.bold16.copyWith(color: Colors.white),),
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

                       Get.to(TourTeam(), arguments: itemTeamTour)
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
                              Icon(Icons.sports_soccer,color: Colors.white,),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
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
                      height: 32.h,
                      width: 120.w,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child:  GestureDetector(
                        onTap: ()=> {

                          Get.to(Schedule(),arguments: itemScheldule),

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
                              Icon(Icons.schedule,color: Colors.white,),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
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
                      height: 32.h,
                      width: 120.w,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child:  GestureDetector(
                        onTap: () async {

                          Get.to(TableTour(),arguments: itemTable);
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
                              Icon(Icons.access_time_filled,color: Colors.white,),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
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
                    // Container(
                    //   height: 32.h,
                    //   width: 120.w,
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 16),
                    //   child:  GestureDetector(
                    //     child: Container(
                    //       width: 100.w,
                    //       height: 30.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.bgWhiteLow1,
                    //         borderRadius: BorderRadius.circular(8),
                    //         border:
                    //         Border.all(color: AppColors.bgwhiteLow2),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment:
                    //         MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           Icon(Icons.settings,color: Colors.white,),
                    //           Container(
                    //             margin: const EdgeInsets.symmetric(
                    //                 horizontal: 8),
                    //             child: Text(
                    //               'Tùy chỉnh',
                    //               style: AppTextStyles.regular16
                    //                   .copyWith(color: AppColors.bgWhite),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: 32.h,
                    //   width: 120.w,
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 16),
                    //   child:  GestureDetector(
                    //     onTap: () {
                    //       teamDetailController.updateStatusTeam("APPLY",itemDetail.id!);
                    //     },
                    //     child: Container(
                    //       width: 140.w,
                    //       height: 30.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.bgWhiteLow1,
                    //         borderRadius: BorderRadius.circular(8),
                    //         border:
                    //         Border.all(color: AppColors.bgwhiteLow2),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment:
                    //         MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           Container(
                    //             margin: const EdgeInsets.symmetric(
                    //                 horizontal: 8),
                    //             child: Text(
                    //               'Mở ứng tuyển',
                    //               style: AppTextStyles.regular16
                    //                   .copyWith(color: AppColors.bgWhite),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: 32.h,
                    //   width: 120.w,
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 16),
                    //   child:  GestureDetector(
                    //     onTap: () {
                    //       teamDetailController.updateStatusTeam("ACTIVE",itemDetail.id!);
                    //     },
                    //     child: Container(
                    //       width: 140.w,
                    //       height: 30.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.bgWhiteLow1,
                    //         borderRadius: BorderRadius.circular(8),
                    //         border:
                    //         Border.all(color: AppColors.bgwhiteLow2),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment:
                    //         MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           Container(
                    //             margin: const EdgeInsets.symmetric(
                    //                 horizontal: 8),
                    //             child: Text(
                    //               'Đóng ứng tuyển',
                    //               style: AppTextStyles.regular16
                    //                   .copyWith(color: AppColors.bgWhite),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
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