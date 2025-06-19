import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/auth_repository.dart';
import '../data/repositories/common_repository.dart';
import '../network/api_controller.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  if (s1.isRegistered<CommonRepository>()) {
    await unRegister();
  }

  if (Get.isRegistered<ApiControllerV1>()) {
    await Get.delete<ApiControllerV1>();
  }

  Get.put(ApiControllerV1());

  AuthRepository authRepository =
  AuthRepository(apiControllerV1: Get.find<ApiControllerV1>());
  s1.registerLazySingleton(() => authRepository);

  CommonRepository commonRepository =
  CommonRepository(apiControllerV1: Get.find<ApiControllerV1>());
  s1.registerLazySingleton(() => commonRepository);
}

Future<void> unRegister() async {
  s1..unregister<AuthRepository>()
  ..unregister<CommonRepository>();
}
