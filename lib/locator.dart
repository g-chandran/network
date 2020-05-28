import 'package:connectivity_test/connectivity_manager.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

setupLocator() {
  locator.registerLazySingleton(() => ConnectivityManager());
}
