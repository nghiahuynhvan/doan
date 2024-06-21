import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballmanager/presentation/match/details/match_details.dart';
import 'package:footballmanager/presentation/match/match_controller.dart';
import 'package:footballmanager/presentation/team/team_controller.dart';
import 'package:get/get.dart';

import '../../common/enum/e_status_match.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  MatchController matchController = MatchController.to;

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
        child: Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Lịch Đấu',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.appbarWhiteLow,
        elevation: 0,
      ),
      body: Obx(
        () => matchController.itemMatchesByTeam.value != null
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: matchController.itemMatchesByTeam.value!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var itemMaches =
                          matchController.itemMatchesByTeam.value![index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(MatchDetails(),arguments: itemMaches );
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    EStatusMatch.init(itemMaches.status).title,
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
                        ),
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
