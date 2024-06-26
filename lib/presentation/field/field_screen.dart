import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/core/styles/app_common_title.dart';
import 'package:footballmanager/presentation/field/field_controller.dart';
import 'package:footballmanager/presentation/field/item_tour_detail.dart';
import 'package:get/get.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';
import '../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class FieldPage extends StatefulWidget {
  const FieldPage({super.key});

  @override
  State<FieldPage> createState() => _FieldPageState();
}

class _FieldPageState extends State<FieldPage> {
  FieldController tournamentController = FieldController.to;

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
        child: Scaffold(
            appBar: AppBar(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Giải đấu',
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
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //
                      //           margin: const EdgeInsets.symmetric(
                      //               horizontal: 16, vertical: 16),
                      //           child: Obx(() {
                      //             return GestureDetector(
                      //               child: Container(
                      //                 padding : EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      //                 decoration: BoxDecoration(
                      //                   color: AppColors.bgWhiteLow1,
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   border: Border.all(
                      //                       color: AppColors.bgwhiteLow2),
                      //                 ),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Container(
                      //                       padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                      //                       child: Text(
                      //                         homeController.situation.value,
                      //                         style: AppTextStyles.regular16
                      //                             .copyWith(
                      //                             color: AppColors.bgWhite),
                      //                       ),
                      //                     ),
                      //                     Icon(
                      //                       Icons.arrow_drop_down,
                      //                       color: AppColors.bgWhite,
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               onTap: () => {
                      //                 context.showAppBottomSheet(
                      //                   child: CustomSituation(),
                      //                   isDismissible: false,
                      //                 )
                      //               },
                      //             );
                      //           })),
                      //       Container(
                      //
                      //           margin: const EdgeInsets.symmetric(
                      //               horizontal: 8, vertical: 16),
                      //           child: Obx(() {
                      //             return GestureDetector(
                      //               child: Container(
                      //                 padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                      //
                      //                 decoration: BoxDecoration(
                      //                   color: AppColors.bgWhiteLow1,
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   border: Border.all(
                      //                       color: AppColors.bgwhiteLow2),
                      //                 ),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Container(
                      //                       padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                      //                       child: Text(
                      //                         homeController.form.value,
                      //                         style: AppTextStyles.regular16
                      //                             .copyWith(
                      //                             color: AppColors.bgWhite),
                      //                       ),
                      //                     ),
                      //                     Icon(
                      //                       Icons.arrow_drop_down,
                      //                       color: AppColors.bgWhite,
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               onTap: () => {
                      //                 context.showAppBottomSheet(
                      //                   child: CustomForm(),
                      //                   isDismissible: false,
                      //                 )
                      //               },
                      //             );
                      //           })),
                      //       Container(
                      //           margin: const EdgeInsets.symmetric(
                      //               horizontal: 8, vertical: 8),
                      //           child: Obx(() {
                      //             return GestureDetector(
                      //
                      //               child: Container(
                      //                 padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                      //                 decoration: BoxDecoration(
                      //                   color: AppColors.bgWhiteLow1,
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   border: Border.all(
                      //                       color: AppColors.bgwhiteLow2),
                      //                 ),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Container(
                      //                       padding:  EdgeInsets.symmetric(horizontal: 4, vertical:4 ),
                      //                       child: Text(
                      //                         homeController.location.value,
                      //                         style: AppTextStyles.regular16
                      //                             .copyWith(
                      //                             color: AppColors.bgWhite),
                      //                       ),
                      //                     ),
                      //                     Icon(
                      //                       Icons.arrow_drop_down,
                      //                       color: AppColors.bgWhite,
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               onTap: () => {
                      //                 context.showAppBottomSheet(
                      //                   child: const CustomLocation(),
                      //                   isDismissible: false,
                      //                 )
                      //               },
                      //             );
                      //           })),
                      //     ],
                      //   ),
                      // ),
                      tournamentController.itemTournament.value != null
                          ? Expanded(
                              child: SingleChildScrollLoadView(
                                onRefresh: () async {
                                  // _onRefresh();
                                },
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: tournamentController
                                      .itemTournament.value!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var itemTournament = tournamentController
                                        .itemTournament.value![index];
                                    return GestureDetector(
                                      onTap: ()async {
                                        await tournamentController.getTourDetails(itemTournament.id!);
                                        Get.to(TourDetails());
                                        // Get.toNamed(Routers.matches,
                                        //     arguments: itemTeamMatchCriteria);
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: AppColors.bgWhiteLow1,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: AppColors.bgwhiteLow2),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w,
                                                    vertical: 4.h),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .green.shade50,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Text(
                                                        tournamentController
                                                            .getTitleVn(
                                                                itemTournament
                                                                    .status!),
                                                        style: AppTextStyles
                                                            .regular13
                                                            .copyWith(
                                                                color: Colors
                                                                    .green),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 8.w),
                                                      child: Text(
                                                        itemTournament.maxTeam
                                                                .toString() +
                                                            " đội",
                                                        style: AppTextStyles
                                                            .regular13
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                        child: itemTournament
                                                                        .imageList![
                                                                    0] !=
                                                                null
                                                            ? Image.network(
                                                                itemTournament
                                                                    .imageList![0],
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
                                                          itemTournament.name!,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyles
                                                              .regular16
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .bgWhite),
                                                        ),
                                                        Text(
                                                          AppCommonTitle().getForm(itemTournament.type!),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyles
                                                              .regular14
                                                              .copyWith(
                                                              color: AppColors
                                                                  .bgWhiteLow5),
                                                        ),
                                                        Text(
                                                          itemTournament.personContact!,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyles
                                                              .regular14
                                                              .copyWith(
                                                              color: AppColors
                                                                  .bgWhiteLow5),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                itemTournament
                                                                    .address!,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: AppTextStyles
                                                                    .regular14
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .bgWhiteLow5),
                                                              ),
                                                              width: 200.w,
                                                            ),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),

                                                  // Expanded(
                                                  //   child: Container(
                                                  //       margin: EdgeInsets.all(8),
                                                  //       width: 80,
                                                  //       height: 80,
                                                  //       child: Align(
                                                  //           alignment: Alignment
                                                  //               .bottomCenter,
                                                  //           child: Text(
                                                  //             itemTournament.address!,
                                                  //             style: AppTextStyles
                                                  //                 .regular13
                                                  //                 .copyWith(
                                                  //                     color: AppColors
                                                  //                         .bgWhiteLow5),
                                                  //             maxLines: 1,
                                                  //             overflow: TextOverflow
                                                  //                 .ellipsis,
                                                  //           ))),
                                                  // )
                                                ],
                                              ),
                                            ],
                                          )),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            )));
  }
}
