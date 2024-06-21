import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballmanager/presentation/team/components/info_memebr_team.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/serviceable/auth_serviceable.dart';
import '../../../shared/widget/app_bg_body_view.dart';
import '../../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';
import '../myteam/team_detail_controller.dart';

class MemberTeam extends StatefulWidget {
  const MemberTeam({super.key});

  @override
  State<MemberTeam> createState() => _MemberTeamState();
}

class _MemberTeamState extends State<MemberTeam> {

  final authStoreService = AuthStore.to;
  void _onRefresh() async {
    applicationController.fetchListApplyPending(
        teamId: authStoreService.idTeam, status: 'CONFIRMED');
  }

  TeamDetailController applicationController = TeamDetailController.to;
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Thành viên',
              style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.appbarWhiteLow,
          elevation: 0,
        ),
        body: Container(
          child: Obx(
                () {
              final Items = applicationController.itemApplyUser.value;

              if (Items != null) {
                if (Items!.isNotEmpty) {
                  return SingleChildScrollLoadView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: Items.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = Items[index];
                        return GestureDetector(
                          onTap: () async{
                            await applicationController.getUserDetails(item.member!.id);
                            Get.to(InforMemberTeam(),arguments: item);
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    item.member!.fullName!,
                                    style: AppTextStyles.bold16
                                        .copyWith(color: AppColors.bgWhite),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  child: Text(
                                    item.member!.fullName!,
                                    style: AppTextStyles.bold13
                                        .copyWith(color: AppColors.bgWhiteLow6),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 4, left: 16, right: 36),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: item.member?.favoritePosition,
                                          style: AppTextStyles.regular13
                                              .copyWith(
                                              color: AppColors.bgWhite),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    onRefresh: () async {
                      _onRefresh();
                    },
                  );
                } else {
                  return Container();
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
