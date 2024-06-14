import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footballmanager/presentation/dashboard/dashboard_controller.dart';
import 'package:footballmanager/presentation/field/field_screen.dart';
import 'package:footballmanager/presentation/match/match_controller.dart';
import 'package:footballmanager/presentation/match/match_screen.dart';
import 'package:footballmanager/presentation/profile/profile_screen.dart';
import 'package:get/get.dart';

import '../../core/routing/route_path.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_icons.dart';
import '../../core/styles/app_text_style.dart';
import '../home/home_screen.dart';
import '../team/team_screen.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  MyDashBoardController controller = MyDashBoardController.to;
  MatchController matchController = MatchController.to;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDashBoardController>(
      builder: (_) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            sizing: StackFit.passthrough,
            children: const [
              HomePage(),
              TeamPage(),
              MatchPage(),
              FieldPage(),
              ProfilePage()
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              backgroundColor: AppColors.tabbarBackgroud,
              unselectedItemColor: AppColors.bgWhite.withOpacity(0.3),
              selectedItemColor: AppColors.bgWhite,
              currentIndex: controller.tabIndex,
              selectedLabelStyle: AppTextStyles.regular11,
              unselectedLabelStyle: AppTextStyles.regular11,
              onTap: (index) async {
                if(index == 2)
                  {
                    matchController.getMatchesByTeam();
                    Get.to(MatchPage(), routeName: Routers.match);
                  }
                else
                  {
                    controller.changeTabIndex(index);
                  }


              },
              items: [
                _bottombarItem(
                    AppIcons.icnHome, 'Home', AppIcons.icnHomeActive),
                _bottombarItem(AppIcons.icnHistorySquare, 'Team',
                    AppIcons.icnHistorySquareActive),
                _bottombarItem(AppIcons.icnHistorySquare, 'Match',
                    AppIcons.icnHistorySquareActive),
                _bottombarItem(AppIcons.icnNotification, 'Tournament',
                    AppIcons.icnNotificationActive),
                _bottombarItem(
                    AppIcons.icnProfile, 'Profile', AppIcons.icnProfileActive),
              ],
            ),
          ),
        );
      },
    );
  }
}

_bottombarItem(String icon, String label, String icon_active) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon,
      height: 24,
      width: 24.w,
    ),
    label: label,
    activeIcon: SvgPicture.asset(
      icon_active,
      height: 24,
      width: 24.w,
    ),
  );
}
