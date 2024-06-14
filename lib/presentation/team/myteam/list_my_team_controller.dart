// import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
// import 'package:footballmanager/domain/repositories/team/team_by_user_repository.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../common/constants/pref_constants.dart';
//
// class ListMyTeamController extends GetxController {
//   ListMyTeamController(this.teamByUserRepository);
//   static ListMyTeamController get to => Get.find();
//   late RxInt numberTeam = 0.obs;
//   final storage = Get.find<SharedPreferences>();
//
//   TeamByUserRepository teamByUserRepository;
//
//   var itemTeamByUser = Rxn<List<TeamByUserModel>>();
//
//
//   @override
//   void onInit()
//   {
//     super.onInit();
//     fetchListTeamByUser(id: storage.getString(PrefsConstants.id)??'');
//   }
//   Future<void> fetchListTeamByUser({required String id}) async {
//     final result = await teamByUserRepository.getTeamByUserId(id: id);
//     result.fold((left) => print("error ${left.toString()}"), (right) {
//       itemTeamByUser.value = right;
//     });
//   }
// }
