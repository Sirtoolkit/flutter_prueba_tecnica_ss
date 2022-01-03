import 'package:get_it/get_it.dart';

import '/utils/navigation_services.dart';
import '/services/repos_user_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ReposUserServices>(ReposUserServices());
  locator.registerSingleton<NavigationServices>(NavigationServices());
}
