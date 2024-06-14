import 'package:footballmanager/domain/models/home/matches_criteria_model.dart';
import 'package:footballmanager/domain/repositories/home/list_matches_criteria_repository.dart';
import 'package:get/get.dart';

import '../../common/enum/e_type_court.dart';
import '../../domain/repositories/home/create_matches_critetia_repository.dart';
import '../../domain/serviceable/auth_serviceable.dart';

class HomeController extends GetxController {
  HomeController(
      this.listMatchesCriteriaRepository, this.createMatchesCriteriaRepository);

  static HomeController get to => Get.find();

  late ListMatchesCriteriaRepository listMatchesCriteriaRepository;

  late CreateMatchesCriteriaRepository createMatchesCriteriaRepository;

  var itemMatchesCriteria = Rxn<List<MatchCriteriaModel>>();

  RxString situation = 'Trạng thái'.obs;
  RxString form = 'Hình thức'.obs;
  RxString location = 'Khu vực'.obs;
  var listTimeMatch = RxList<String>([]);
  late RxString endTime = ''.obs;
  late RxInt index;

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

  Future<void> createMatchesCriteria(MatchCriteriaModel data) async {
    final result =
        await createMatchesCriteriaRepository.CreateMatchesCriteria(data);
  }
}
