import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballmanager/common/enum/e_status.dart';
import 'package:footballmanager/common/enum/e_status_apply.dart';
import 'package:footballmanager/domain/models/team/member_team_model.dart';
import 'package:footballmanager/presentation/team/myteam/team_detail_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/serviceable/auth_serviceable.dart';
import '../../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final authStoreService = AuthStore.to;
  void _onRefresh() async {
    applicationController.fetchListApplyPending(
        teamId: authStoreService.idTeam, status: 'PENDING');
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
              'Thành viên ứng tuyển',
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
                          onTap: () {},
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
                                          text: item.member!.favoritePosition,
                                          style: AppTextStyles.regular13
                                              .copyWith(
                                                  color: AppColors.bgWhite),
                                        ),
                                        TextSpan(),
                                        TextSpan(),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print('aaaaaaa${item.id!}');
                                        print('aaaaaaa${item.teamId!}');
                                        print('aaaaaaa${item.member!.id}');
                                        print(
                                            'aaaaaa${EStatusApply.confirmed}');

                                        applicationController.updateMemberTeam(
                                            item.id!,
                                            MemberData(
                                                id: item.id!,
                                                teamId: item.teamId,
                                                member: MemberInfo(
                                                    createAt:
                                                        item.member!.createAt,
                                                    updateAt:
                                                        item.member!.createAt,
                                                    id: item.member!.id,
                                                    fullName:
                                                        item.member!.fullName,
                                                    nickName:
                                                        item.member!.nickName,
                                                    favoritePosition: item
                                                        .member!
                                                        .favoritePosition,
                                                    description: item
                                                        .member!.description,
                                                    gender: item.member!.gender,
                                                    birthday:
                                                        item.member!.birthday,
                                                    signInMethod: item
                                                        .member!.signInMethod,
                                                    status: item.member!.status,
                                                    avatarUrl:
                                                        item.member!.avatarUrl,
                                                    username:
                                                        item.member!.username,
                                                    email: item.member!.email,
                                                    verifyEmail: item
                                                        .member!.verifyEmail),
                                                status: 'CONFIRMED',
                                                role: item.role,
                                                dateJoin: item.dateJoin,
                                                joinMethod: item.joinMethod,
                                                position: item.position));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.appbarWhiteLow,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        'Đồng ý',
                                        style: AppTextStyles.bold13.copyWith(
                                          color: AppColors.bgWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
