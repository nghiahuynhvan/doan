import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/app.dart';
import 'package:footballmanager/common/constants/app_constants.dart';
import 'package:footballmanager/common/enum/e_status_apply.dart';
import 'package:footballmanager/common/extensions/context_extensions/bottom_sheet_extensions.dart';
import 'package:footballmanager/presentation/home/components/custom_form.dart';
import 'package:footballmanager/presentation/home/components/custom_location.dart';
import 'package:footballmanager/presentation/home/components/custom_situation.dart';
import 'package:footballmanager/presentation/home/components/form_matches_criteria.dart';
import 'package:footballmanager/presentation/home/home_controller.dart';
import 'package:get/get.dart';

import '../../core/routing/route_path.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';
import '../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController.to;

  void _onRefresh() async {
    homeController.getAllMatchesCriteria();
  }

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
        child: Scaffold(
            appBar: AppBar(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Trang chủ',
                  style:
                      AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: AppColors.appbarWhiteLow,
              elevation: 0,
            ),
            body: Stack(
              children: <Widget>[
                Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(

                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Obx(() {
                                  return GestureDetector(
                                    child: Container(
                                      padding : EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.bgWhiteLow1,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.bgwhiteLow2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                          padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                                            child: Text(
                                              homeController.situation.value,
                                              style: AppTextStyles.regular16
                                                  .copyWith(
                                                      color: AppColors.bgWhite),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.bgWhite,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () => {
                                      context.showAppBottomSheet(
                                        child: CustomSituation(),
                                        isDismissible: false,
                                      )
                                    },
                                  );
                                })),
                            Container(

                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: Obx(() {
                                  return GestureDetector(
                                    child: Container(
                                      padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),

                                      decoration: BoxDecoration(
                                        color: AppColors.bgWhiteLow1,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.bgwhiteLow2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                                            child: Text(
                                              homeController.form.value,
                                              style: AppTextStyles.regular16
                                                  .copyWith(
                                                      color: AppColors.bgWhite),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.bgWhite,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () => {
                                      context.showAppBottomSheet(
                                        child: CustomForm(),
                                        isDismissible: false,
                                      )
                                    },
                                  );
                                })),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Obx(() {
                                  return GestureDetector(

                                    child: Container(
                                      padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                                      decoration: BoxDecoration(
                                        color: AppColors.bgWhiteLow1,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.bgwhiteLow2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                                            child: Text(
                                              homeController.location.value,
                                              style: AppTextStyles.regular16
                                                  .copyWith(
                                                      color: AppColors.bgWhite),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.bgWhite,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () => {
                                      context.showAppBottomSheet(
                                        child: const CustomLocation(),
                                        isDismissible: false,
                                      )
                                    },
                                  );
                                })),
                          ],
                        ),
                      ),
                      homeController.itemMatchesCriteria.value != null
                          ? Expanded(
                              child: SingleChildScrollLoadView(
                                onRefresh: () async {
                                  _onRefresh();
                                },
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: homeController
                                      .itemMatchesCriteria.value!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    // var itemTeamMatch = homeController.itemTeamByUser;
                                    var itemTeamMatchCriteria = homeController
                                        .itemMatchesCriteria.value![index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routers.matches,
                                            arguments: itemTeamMatchCriteria);
                                      },
                                      child: itemTeamMatchCriteria
                                                  .status!.title ==
                                              homeController.getTitleByLanguage(
                                                  homeController
                                                      .situation.value) && itemTeamMatchCriteria.addressList![0].city == homeController.location.value
                                          ? Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                color: AppColors.bgWhiteLow1,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color:
                                                        AppColors.bgwhiteLow2),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8,
                                                        vertical: 8),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 80,
                                                        height: 80,
                                                        child: itemTeamMatchCriteria
                                                                    .team!
                                                                    .urlImage !=
                                                                null
                                                            ? Image.network(
                                                                itemTeamMatchCriteria
                                                                    .team!
                                                                    .urlImage!,
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
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          itemTeamMatchCriteria
                                                              .team!.name,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyles
                                                              .regular16
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .bgWhite),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              itemTeamMatchCriteria
                                                                  .team!
                                                                  .skillLevel!
                                                                  .title,
                                                              style: AppTextStyles
                                                                  .regular14
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .bgWhiteLow5),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        margin:
                                                            EdgeInsets.all(8),
                                                        width: 80,
                                                        height: 80,
                                                        child: Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              itemTeamMatchCriteria
                                                                  .timeMatchList!
                                                                  .join(','),
                                                              style: AppTextStyles
                                                                  .regular13
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .bgWhiteLow5),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ))),
                                                  )
                                                ],
                                              ))
                                          : Container(),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(),
                      Row(children: [
                        Expanded(
                          child: Container(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(FormMatchesCriteria());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                'TẠO TRẬN ĐẤU',
                                style: AppTextStyles.bold16
                                    .copyWith(color: AppColors.bgWhite),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            )));
  }
}
