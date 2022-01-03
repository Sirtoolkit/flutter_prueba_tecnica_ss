import 'package:flutter_prueba_tecnica_ss/services/repos_user_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance();

void setupLocator() {
  locator.registerSingleton(ReposUserServices());
}
