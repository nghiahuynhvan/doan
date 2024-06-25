import 'package:footballmanager/domain/models/address/district_model.dart';
import 'package:footballmanager/domain/models/home/address_model.dart';
import 'package:footballmanager/domain/models/home/matches_criteria_model.dart';
import 'package:footballmanager/domain/repositories/address/address_city_repository.dart';
import 'package:footballmanager/domain/repositories/address/district_repository.dart';
import 'package:footballmanager/domain/repositories/home/list_matches_criteria_repository.dart';
import 'package:footballmanager/domain/serviceable/auth_serviceable.dart';
import 'package:get/get.dart';

import '../../common/enum/e_type_court.dart';
import '../../domain/models/address/address_city_model.dart';
import '../../domain/repositories/home/create_matches_critetia_repository.dart';


class HomeController extends GetxController {
  HomeController(
      this.listMatchesCriteriaRepository,
      this.createMatchesCriteriaRepository,
      this.addressCityRepository,
      this.districtRepository);

  static HomeController get to => Get.find();
  final authStore = AuthStore.to;

  late ListMatchesCriteriaRepository listMatchesCriteriaRepository;

  late CreateMatchesCriteriaRepository createMatchesCriteriaRepository;

  late AddressCityRepository addressCityRepository;

  late DistrictRepository districtRepository;

  var itemAddress = Rxn<List<AddressCityModel>>();
  // var itemDistrict = Rxn<List<DistrictModel>>();
  RxList<DistrictModel> itemDistrict = <DistrictModel>[].obs;

  var itemMatchesCriteria = Rxn<List<MatchCriteriaModel>>();
  var itemMatchesCriteriaByUserId = Rxn<List<MatchCriteriaModel>>();
  var itemMatchesCriteriaByTeamId = Rxn<List<MatchCriteriaModel>>();

  RxString situation = 'Đang chờ'.obs;
  RxString form = 'Hình thức'.obs;
  RxString location = 'Đà Nẵng'.obs;
  var listTimeMatch = RxList<String>([]);
  late RxString endTime = ''.obs;
  late RxInt index;
  Rx<AddressCityModel?> selectedCity = Rx<AddressCityModel?>(null);
  Rx<DistrictModel?> selectedDistrict = Rx<DistrictModel?>(null);
  late RxInt selectedId;
  late RxString selectedSkillLevel = ''.obs;
  final RxList<String> allCourtTypes =
      RxList<String>.from(ETypeCourt.GetAllTypes());
  final RxList<String> allCourTypesPicker = <String>[].obs;
  final RxList<int> A = <int>[].obs;

  void addAllCourtTypeByUser() {
    allCourTypesPicker.clear();
    for (int i = 0; i <= A.length - 1; i++) {
      allCourTypesPicker.add(allCourtTypes[A[i]]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllMatchesCriteria();
    getAllMatchesCriteriaByTeamId(authStore.idTeam);
    getAllMatchesCriteriaByUserId(authStore.idUser);
    getAddress();
    getDistrict(6733);
  }

  void updateSituation(String inputText) {
    situation.value = inputText;
  }

  void updateForm(String inputText) {
    form.value = inputText;
  }

  void updateLocation(String inputText) {
    location.value = inputText;
  }

  Future<void> getAllMatchesCriteria() async {
    final result = await listMatchesCriteriaRepository.getAllMatchCriteria();
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemMatchesCriteria.value = right;
    });
  }

  Future<void> getAllMatchesCriteriaByUserId(String userId)  async {
    final result = await listMatchesCriteriaRepository.getAllMatchCriteriabyUserId(userId);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemMatchesCriteriaByUserId.value = right;
    });
  }

  Future<void> getAllMatchesCriteriaByTeamId(String teamId)  async {
    final result = await listMatchesCriteriaRepository.getAllMatchCriteriabyTeamId(teamId);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemMatchesCriteriaByTeamId.value = right;
    });
  }

  Future<void> createMatchesCriteria(MatchCriteriaModel data) async {
    final result =
        await createMatchesCriteriaRepository.CreateMatchesCriteria(data);
  }


  Future<void> getAddress() async {
    final result = await addressCityRepository.getCity();
    result.fold((left) => print("error ${left.toString()}"), (right) {
      itemAddress.value = right;
    });
  }
  Future<void> getDistrict(int id)async {
    final result = await districtRepository.getDistrictById(id);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      selectedDistrict.value = null;
      itemDistrict.value!.clear();
      itemDistrict.value = right;
    });

  }
  String getTitleByLanguage(String titleVi) {
    switch (titleVi) {
      case "Đã hủy":
        return "CANCEL";
      case "Đang chờ":
        return "PENDING";
      case "Đã xác nhận":
        return "CONFIRMED";
      default:
        throw Exception("Invalid title in Vietnamese: $titleVi");
    }
  }
  String getCourtTitle(String titleCourt)
  {
    switch(titleCourt)
        {
      case "FIVE_A_SIDE":
        return "Sân 5";
      case " SEVEN_A_SIDE":
        return "Sân 7";
      case "ELEVEN_A_SIDE":
        return "Sân 11";
      case "FUTSAL":
        return "sân futsal";
      case "BEACH_FOOTBALL":
        return "sân biển";
      case "INDOOR_FOOTBALL":
        return "sân ngoài trời";
      case "":
        return "Chưa có dữ liệu";
      default:
        throw Exception("Invalid title in Vietnamese: $titleCourt");
    }
        }

}
