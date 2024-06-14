import 'package:footballmanager/domain/models/home/match_model.dart';
import 'package:get/get.dart';

import '../../../common/enum/e_type_court.dart';
import '../../../domain/models/home/address_model.dart';
import '../../../domain/models/home/matches_criteria_model.dart';
import '../../../domain/repositories/home/create_match_repository.dart';

class MatchesCriteriaDetailController extends GetxController {
  MatchesCriteriaDetailController(this.createMatchRepository);
  static  MatchesCriteriaDetailController get to => Get.find();
  late MatchCriteriaModel itemDetailHome;
  var listTimeMatch = RxList<String>([]);
  late RxString selectedStyle = ''.obs;
   RxString selectedTimeMatch = ''.obs;
  late RxString selectedAddress = ''.obs;
  late RxString selectedSkillLevel = ''.obs;
  late RxString selectedCourtType = ''.obs;


  late CreateMatchRepository createMatchRepository;

  @override
  void onInit() {
    super.onInit();
    itemDetailHome = Get.arguments;
  }
  RxList<String> getAddressesAsList(List<AddressModel> addressModels) {
    RxList<String> addresses = <String>[].obs;
    for (AddressModel addressModel in addressModels) {
      List<String> addressParts = [];
      if (addressModel.region != null) {
        addressParts.add(addressModel.region!);
      }
      if (addressModel.district != null) {
        addressParts.add(addressModel.district!);
      }
      if (addressModel.city != null) {
        addressParts.add(addressModel.city!);
      }
      addresses.add(addressParts.join(", "));
    }
    return addresses;
  }

  Future<void> createMatches(MatchModel data) async {
    final result = await createMatchRepository.createMatch(data);
  }
}