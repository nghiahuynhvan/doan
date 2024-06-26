import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/models/home/match_model.dart';

class MatchAllDetail extends StatefulWidget {
  const MatchAllDetail({super.key});

  @override
  State<MatchAllDetail> createState() => _MatchAllDetailState();
}

class _MatchAllDetailState extends State<MatchAllDetail> {
  final item = Get.arguments as MatchModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Thông tin chi tiết trận đấu',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'Nhà',
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                                child: CircleAvatar(
                                  radius: 40.r,
                                  backgroundImage:
                                  NetworkImage(item.homeTeam!.urlImage!),
                                ),
                              ),
                              Container(
                                width: 72.w,
                                child: Text(
                                  item.homeTeam!.name,
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '0 - 0',
                                style: AppTextStyles.bold26
                                    .copyWith(color: Colors.white),
                              ),
                              Container(
                                child: Text(
                                  'Thời gian: ' + item.playingTime.toString(),
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                                child: Text(
                                  'Khách',
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                                child: CircleAvatar(
                                  radius: 40.r,
                                  backgroundImage:
                                  NetworkImage(item.awayTeam!.urlImage!),
                                ),
                              ),
                              Container(

                                width: 72.w,
                                child: Text(
                                  item.awayTeam!.name,
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.lightBlueAccent),
                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                'Địa chỉ sân',
                                style: AppTextStyles.bold20
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              child: Text(
                                item.address!,
                                style: AppTextStyles.bold16
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                        margin:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.lightBlueAccent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text(
                                'Thời gian thi đấu',
                                style: AppTextStyles.bold16
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Text(
                                item.matchDate!,
                                style: AppTextStyles.bold19
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: double.infinity,
                          padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                          margin:
                          EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.lightBlueAccent),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text(
                                  'Thông tin đối thủ',
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
