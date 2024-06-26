import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/core/styles/app_common_title.dart';
import 'package:footballmanager/presentation/team/team_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:footballmanager/shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';
import 'package:get/get.dart';

import '../../../core/routing/route_path.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_text_style.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  TeamController teamController = TeamController.to;

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child:teamController.itemTeamAll.value != null ? SingleChildScrollLoadView(
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: teamController.itemTeamAll.value?.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var itemActiveTeam = teamController.itemTeamAll.value?[index];
              return GestureDetector(
                onTap: () =>
                    {Get.toNamed(Routers.discovery, arguments: itemActiveTeam)},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: AppColors.bgWhiteLow1,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.bgwhiteLow2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: itemActiveTeam!.urlImage!.isNotEmpty
                            ? Container(
                                height: 40.h,
                                width: 40.h,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(itemActiveTeam!.urlImage!),
                                ),
                              )
                            : Container(
                                height: 40.h,
                                width: 40.h,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                                child:const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage(AppImages.userEmpty),
                                ),
                              ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Text(
                              itemActiveTeam.name,
                              style: AppTextStyles.bold16
                                  .copyWith(color: AppColors.bgWhite),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Text(
                              AppCommonTitle().titleSkill(itemActiveTeam.skill),
                              style: AppTextStyles.bold13
                                  .copyWith(color: AppColors.bgWhiteLow5),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 4, left: 16, right: 36),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:  AppCommonTitle().getStatusTitle(itemActiveTeam.statusTeam),
                                    style: AppTextStyles.regular11
                                        .copyWith(color: AppColors.bgWhite),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ): Container(),
    );
  }
}
