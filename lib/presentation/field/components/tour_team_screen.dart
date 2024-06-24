import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/models/tournament/tour_team_model.dart';
import '../../../shared/widget/app_bg_body_view.dart';
import '../../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class TourTeam extends StatefulWidget {
  const TourTeam({super.key});

  @override
  State<TourTeam> createState() => _TourTeamState();
}

class _TourTeamState extends State<TourTeam> {
  List<TourTeamModel> itemTeam = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Đội bóng',
              style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.appbarWhiteLow,
          elevation: 0,
        ),
        body: Container(
          child:  SingleChildScrollLoadView(
        child: ListView.builder(
        shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: itemTeam.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var item = itemTeam[index];
            return GestureDetector(
              onTap: () async{
                // await applicationController.getUserDetails(item.member!.id);
                // Get.to(InforMemberTeam(),arguments: item);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                padding: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: AppColors.bgWhiteLow1,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.bgwhiteLow2),
                ),
                child: Row(
                  children: [
                    Container(
                      margin:
                      EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4.h),
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(
                            8.0),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: item.teamDTO!.urlImage !=
                              null
                              ? Image.network(
                            item.teamDTO!.urlImage!,
                            fit: BoxFit
                                .cover,
                          )
                              : Container(
                            height: 40.h,
                            width: 40.h,
                            margin: const EdgeInsets
                                .symmetric(
                                vertical:
                                16,
                                horizontal:
                                12),
                            child:
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                              AssetImage(
                                AppImages
                                    .userEmpty,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200.w,
                          margin:  EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Text(
                            item.teamDTO!.name!,
                            style: AppTextStyles.bold16
                                .copyWith(color: AppColors.bgWhite),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Text(
                            item.teamDTO!.shortname!,
                            style: AppTextStyles.bold13
                                .copyWith(color: AppColors.bgWhiteLow6),
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Text(
                            item.teamDTO!.city!,
                            style: AppTextStyles.bold13
                                .copyWith(color: AppColors.bgWhiteLow6),
                          ),
                        ),
                        Container(
                          width: 200.w,
                            margin:  EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                          child: Text(
                            item.teamDTO!.playingStyle!,
                            style: AppTextStyles.bold13
                                .copyWith(color: AppColors.bgWhiteLow6),
                            overflow: TextOverflow.ellipsis ,
                            maxLines: 2,
                          )
                        )
                      ],
                    ),
                  ],
                )
              ),
            );
          },
        ),
        onRefresh: () async {
        },
      ),
        ),
      ),
    );
  }
}
