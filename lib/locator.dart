import 'package:get_it/get_it.dart';
import 'package:glowchat/services/analytics_service.dart';
import 'package:glowchat/services/authentiication_serivce.dart';
import 'package:glowchat/services/dialog_service.dart';
import 'package:glowchat/services/firestore_service.dart';
import 'package:glowchat/services/navigation_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AnalyticsServic);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
}
