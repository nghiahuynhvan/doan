import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballmanager/presentation/match/match_all_team_screen.dart';
import 'package:footballmanager/presentation/match/match_controller.dart';
import 'package:footballmanager/presentation/match/match_screen.dart';
import 'package:get/get.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';

class MatchAllScreen extends StatefulWidget {
  const MatchAllScreen({super.key});

  @override
  State<MatchAllScreen> createState() => _MatchAllScreenState();
}

class _MatchAllScreenState extends State<MatchAllScreen> {
  MatchController matchController = MatchController.to;
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Lịch đấu',
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
                    text: 'Tất cả',
                  ),
                  Tab(
                    text: 'Đội bóng',
                  ),
                ],
                controller: matchController.tabController1,
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
                controller: matchController.tabController1,
                children: <Widget>[
                  MatchAllTeamScreen(),
                  MatchPage(),

                ],
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
