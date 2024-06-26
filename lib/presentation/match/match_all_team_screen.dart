import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/presentation/match/details/match_all_detail.dart';
import 'package:footballmanager/presentation/match/match_controller.dart';
import 'package:get/get.dart';

import '../../common/enum/e_status_match.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';
import '../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class MatchAllTeamScreen extends StatefulWidget {
  const MatchAllTeamScreen({super.key});

  @override
  State<MatchAllTeamScreen> createState() => _MatchAllTeamScreenState();
}

class _MatchAllTeamScreenState extends State<MatchAllTeamScreen> {
  MatchController matchController = MatchController.to;
  void _onRefresh() async {
    matchController.tiemMatchesAll(
    );
  }
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
        child: Scaffold(
          body: Obx(
                () => matchController.tiemMatchesAll.value != null
                ? Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollLoadView(
                onRefresh: () async {
                  _onRefresh();
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: matchController.tiemMatchesAll.value!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var itemMaches =
                    matchController.tiemMatchesAll.value![index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(MatchAllDetail(), arguments: itemMaches);
                      },
                      child: EStatusMatch.init(itemMaches.status).title ==
                          'Đã lên lịch'
                          ? Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.bgWhiteLow1,
                          borderRadius: BorderRadius.circular(8),
                          border:
                          Border.all(color: AppColors.bgwhiteLow2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                      itemMaches.homeTeam!.urlImage!),
                                ),
                                Container(
                                  width: 100,
                                  child: Text(
                                    itemMaches.homeTeam!.name,
                                    style: AppTextStyles.bold11
                                        .copyWith(color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  itemMaches.matchDate!,
                                  style: AppTextStyles.regular11
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  width: 100,
                                  child: Text(
                                    itemMaches.address!,
                                    style: AppTextStyles.regular11
                                        .copyWith(color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  EStatusMatch.init(itemMaches.status)
                                      .title,
                                  style: AppTextStyles.regular11
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                      itemMaches.awayTeam!.urlImage!),
                                ),
                                Container(
                                  width: 100,
                                  child: Text(
                                    itemMaches.awayTeam!.name,
                                    style: AppTextStyles.bold11
                                        .copyWith(color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                          : Container(),
                    );
                  },
                ),
              ),
            )
                : Container(),
          ),
        ));
  }
}
