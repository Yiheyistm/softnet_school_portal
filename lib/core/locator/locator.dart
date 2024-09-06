import 'package:get_it/get_it.dart';
import 'package:softnet_school_portal/core/utils/services/storage_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final GetIt locator = GetIt.I;

class DependancyInjection {
  static init() {
    locator.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());
    locator.registerLazySingleton<StorageService>(() => StorageService());
  }
}
