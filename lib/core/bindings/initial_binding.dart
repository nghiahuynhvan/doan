import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/logger/app_logger.dart';
import '../../common/services/network/custom_http_client.dart';
import '../../domain/serviceable/auth_serviceable.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get..put<CustomHttpClient>(HttpClientImpl(Dio()),
        permanent: true)..put<AppLogger>(AppLogger.instance, permanent: true);
    await Get.putAsync<SharedPreferences>(
          () async => await SharedPreferences.getInstance(),
      permanent: true,
    );
    await _initServiceableBinding();

  }
  Future<void> _initServiceableBinding() async {
    final prefs = await SharedPreferences.getInstance();
    await Get.putAsync<AuthStore>(() async => AuthStore(prefs),
        permanent: true);
  }

}