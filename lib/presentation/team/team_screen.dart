import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballmanager/presentation/profile/components/profile_edit.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_screen.dart';
import 'package:footballmanager/presentation/team/myteam/list_my_team_screen.dart';
import 'package:footballmanager/presentation/team/team_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  TeamController teamController = TeamController.to;

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
        body: Column(
          children: [
            Container(
              color: AppColors.appbarWhiteLow,
              child: TabBar(
                tabs: const [
                  Tab(
                    text: 'Đội bóng',
                  ),
                  Tab(
                    text: 'Khám phá',
                  ),
                ],
                controller: teamController.tabController,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.bgBlack,
                      width: 1.0,
                    ),
                  ),
                ),
                labelStyle:
                    AppTextStyles.bold18.copyWith(color: AppColors.bgWhite),
                unselectedLabelStyle:
                    AppTextStyles.bold16.copyWith(color: AppColors.bgWhite),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: teamController.tabController,
                children: <Widget>[
                  MyTeamScreen(),
                  DiscoveryScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
