import 'package:footballmanager/core/bindings/application_binding.dart';
import 'package:footballmanager/core/bindings/dashboard_binding.dart';
import 'package:footballmanager/core/bindings/discovery_binding.dart';
import 'package:footballmanager/core/bindings/field_binding.dart';
import 'package:footballmanager/core/bindings/home_binding.dart';
import 'package:footballmanager/core/bindings/list_my_team_binding.dart';
import 'package:footballmanager/core/bindings/login_binding.dart';
import 'package:footballmanager/core/bindings/match_binding.dart';
import 'package:footballmanager/core/bindings/matches_criteria_binding.dart';
import 'package:footballmanager/core/bindings/splash_binding.dart';
import 'package:footballmanager/core/bindings/team_detail_binding.dart';
import 'package:footballmanager/core/routing/route_path.dart';
import 'package:footballmanager/presentation/dashboard/dashboard_screen.dart';
import 'package:footballmanager/presentation/field/field_screen.dart';
import 'package:footballmanager/presentation/home/details/matches_criteria_detail_screen.dart';
import 'package:footballmanager/presentation/home/home_screen.dart';
import 'package:footballmanager/presentation/login/login_screen.dart';
import 'package:footballmanager/presentation/match/match_screen.dart';
import 'package:footballmanager/presentation/profile/profile_screen.dart';
import 'package:footballmanager/presentation/splash_screen/splash_screen.dart';
import 'package:footballmanager/presentation/team/components/application_screen.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_details.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_screen.dart';
import 'package:footballmanager/presentation/team/myteam/list_my_team_controller.dart';
import 'package:footballmanager/presentation/team/myteam/team_detail_screen.dart';
import 'package:footballmanager/presentation/team/team_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../presentation/team/myteam/list_my_team_screen.dart';
import '../bindings/profile_binding.dart';
import '../bindings/team_binding.dart';

class AppPages {
  const AppPages._();

  static List<GetPage> routes = [
    GetPage(
      name: Routers.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routers.dashboard,
      page: () => const MyDashBoard(),
      bindings: [
        DashBoardBinding(),
        HomeBinding(),
        TeamBinding(),
        MatchBinding(),
        ProfileBinding(),
        FieldBinding(),
      ],
    ),
    GetPage(
      name: Routers.login,
      page: () => Login(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routers.team,
      page: () => const TeamPage(),
      bindings: [
        TeamBinding(),
        // ListMyTeamBinding(),
      ],
    ),
    GetPage(
      name: Routers.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routers.field,
      page: () => const FieldPage(),
      binding: FieldBinding(),
    ),
    GetPage(
      name: Routers.match,
      page: () => const MatchPage(),
      binding: MatchBinding(),
    ),
    GetPage(
      name: Routers.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routers.teamdetail,
      page: () => const TeamDetail(),
      binding: TeamDetailBinding(),
    ),
    GetPage(
      name: Routers.application,
      page: () => const ApplicationScreen(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: Routers.discovery,
      page: () => const DiscoveryDetail(),
      binding: DiscoveryBinding(),
    ),
    GetPage(
      name: Routers.matches,
      page: () => const MatchesCriteriaDetail(),
      binding: MatchesCriteriaBinding(),
    ),
  ];
}
