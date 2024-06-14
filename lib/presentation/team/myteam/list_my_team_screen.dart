import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/core/styles/app_colors.dart';
import 'package:footballmanager/core/styles/app_images.dart';
import 'package:footballmanager/core/styles/app_text_style.dart';
import 'package:footballmanager/presentation/home/home_controller.dart';
import 'package:footballmanager/presentation/team/components/add_team_screen.dart';

import 'package:footballmanager/presentation/team/team_controller.dart';
import 'package:get/get.dart';

import '../../../core/routing/route_path.dart';

class MyTeamScreen extends StatefulWidget {
  const MyTeamScreen({super.key});

  @override
  State<MyTeamScreen> createState() => _MyTeamScreenState();
}

class _MyTeamScreenState extends State<MyTeamScreen> {
  TeamController listMyTeamController = TeamController.to;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(
          () => listMyTeamController.itemTeamByUser.value == null
              ? Container()
              : Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  'Số đội',
                                  style: AppTextStyles.bold13
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  listMyTeamController
                                      .itemTeamByUser.value!.length
                                      .toString(),
                                  style: AppTextStyles.bold16
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          listMyTeamController
                              .itemTeamByUser.value!.length != 1 ?
                          GestureDetector(
                            onTap: () async {
                              final abc = await Get.to(AddTeam());
                              if (abc == 'result') {
                                listMyTeamController.fetchListTeamByUser();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white,
                                  // set the border color to blue
                                  width: 2.0, // set the border width to 2 units
                                ),
                              ),
                              child: Text(
                                'Thêm đội',
                                style: AppTextStyles.regular16
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ):Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.bgWhiteLow5,
                                // set the border color to blue
                                width: 2.0, // set the border width to 2 units
                              ),
                            ),
                            child: Text(
                              'Thêm đội',
                              style: AppTextStyles.regular16
                                  .copyWith(color: AppColors.bgWhiteLow5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount:
                            listMyTeamController.itemTeamByUser.value?.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item =
                              listMyTeamController.itemTeamByUser.value![index];
                          if (item == null) {
                            return Container();
                          }
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routers.teamdetail, arguments: item);
                              // HomeController.to.itemTeamByUser = item;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 16 * 2,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              padding: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: AppColors.bgWhiteLow1,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColors.bgwhiteLow2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: item!.UrlImage!.isNotEmpty || item!.UrlImage == null
                                        ? Container(
                                            height: 40.h,
                                            width: 40.h,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 12),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage:
                                                  NetworkImage(item!.urlImage!),
                                            ),
                                          )
                                        : Container(
                                            height: 40.h,
                                            width: 40.h,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 12),
                                            child: const CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  AppImages.userEmpty),
                                            ),
                                          ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(

                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
                                        child: Text(
                                          item.name,
                                          style: AppTextStyles.bold16.copyWith(
                                              color: AppColors.bgWhite),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // width: MediaQuery.of(context).size.width - 40.w -16 * 2,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
                                        child: Text(
                                          item.skill,
                                          style: AppTextStyles.bold13.copyWith(
                                              color: AppColors.bgWhiteLow5),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 4, left: 16, right: 36),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: item.statusTeam,
                                                style: AppTextStyles.regular11
                                                    .copyWith(
                                                        color: AppColors
                                                            .bgWhiteLow5),
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
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
