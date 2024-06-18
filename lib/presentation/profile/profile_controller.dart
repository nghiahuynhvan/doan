import 'dart:async';

import 'package:footballmanager/domain/models/user/user_detail_model.dart';
import 'package:footballmanager/domain/repositories/user/user_detail_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/pref_constants.dart';
import '../../common/services/app_status.dart';
import '../../domain/serviceable/auth_serviceable.dart';

class ProfileController extends GetxController {
  ProfileController(this.userDetailRepository);

  static ProfileController get to => Get.find();
  final storage = Get.find<SharedPreferences>();
  final authStoreService = AuthStore.to;
  late UserDetailRepository userDetailRepository;

  var userDetail = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    AppStatus.dismissLoading();
    final result = await userDetailRepository.getUserDetail(
        idUser: authStoreService.idUser);
    result.fold((left) => print("error ${left.toString()}"), (right) {
      userDetail.value = right;
    });
  }

  RxString fullName = ''.obs;
  RxString faceBook = ''.obs;
  RxString dateBorn = ''.obs;
  RxString address = ''.obs;
  RxString decrib = ''.obs;

  void setUserInfor(String fullname, String faceBook, String dateBorn,
      String address, String decrib) async {
    if (storage.getString(PrefsConstants.userName) != '') {
      storage.setString(PrefsConstants.userName, fullname);
    }
    if (storage.getString(PrefsConstants.faceBook) == '') {
      storage.setString(PrefsConstants.faceBook, faceBook);
    }
    if (storage.getString(PrefsConstants.dateBorn) == '') {
      storage.setString(PrefsConstants.dateBorn, dateBorn);
    }
    if (storage.getString(PrefsConstants.numberPhone) == '') {
      storage.setString(PrefsConstants.numberPhone, address);
    }
    if (storage.getString(PrefsConstants.decrib) == '') {
      storage.setString(PrefsConstants.decrib, decrib);
    }
  }

  String getFullName() {
    return fullName.value =
        (storage.getString(PrefsConstants.userName) ?? '').isNotEmpty
            ? storage.getString(PrefsConstants.userName)!
            : 'Tên';
  }

  String getFaceBook() {
    return faceBook.value =
        (storage.getString(PrefsConstants.faceBook) ?? '').isNotEmpty
            ? storage.getString(PrefsConstants.faceBook)!
            : 'Chưa có tài khoản facebook liên kết';
  }

  String getDateBorn() {
    return dateBorn.value =
        (storage.getString(PrefsConstants.dateBorn) ?? '').isNotEmpty
            ? storage.getString(PrefsConstants.dateBorn)!
            : 'Chưa có ngày sinh';
  }

  String getNumberPhone() {
    return address.value =
        (storage.getString(PrefsConstants.numberPhone) ?? '').isNotEmpty
            ? storage.getString(PrefsConstants.numberPhone)!
            : 'Chưa có số điện thoại';
  }

  String getDecrib() {
    return decrib.value =
        (storage.getString(PrefsConstants.decrib) ?? '').isNotEmpty
            ? storage.getString(PrefsConstants.decrib)!
            : 'Chưa có mô tả';
  }

  final listAchieve = <AchieveModel>[
    AchieveModel(text: 'Giải tham dự', number: 0, urlImage: ''),
    AchieveModel(text: 'Vô địch', number: 0, urlImage: ''),
    AchieveModel(text: 'Giải nhì', number: 0, urlImage: ''),
    AchieveModel(text: 'Giải ba', number: 0, urlImage: ''),
  ];
}

class AchieveModel {
  AchieveModel({
    required this.text,
    required this.number,
    required this.urlImage,
  });

  late String text;
  late int number;
  late String urlImage;
}
