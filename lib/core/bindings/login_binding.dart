import 'package:footballmanager/data/remote/authentication_remote_data_source.dart';
import 'package:footballmanager/domain/repositories/authentication_repository.dart';
import 'package:footballmanager/domain/repositories/login/register_repository.dart';
import 'package:footballmanager/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get
      ..put<RegisterRepository>(RegisterRepositoryImpl(Get.find()))
      ..put<AuthenticationRemoteDataSource>(AuthenticationRemoteDataSourceImpl(Get.find()))
      ..put<AuthenticationRepository>(AuthenticationRepositoryImpl(Get.find()))
      ..put<LoginController>(LoginController(Get.find(),Get.find()));
  }
}