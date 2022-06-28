
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:asset_management/services/shared/navigator_service.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

PreferenceService get preferenceService => locator<PreferenceService>();
NavigationService get navigationService => locator<NavigationService>();
DialogService get dialogService => locator<DialogService>();
PushNotificationService get pushNotificationservice =>locator<PushNotificationService>();//-------

//-----------
class PushNotificationService {
  void configure(String name, String emailId, String password, String organisationName) {}
}

void setupLocator() {

  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => PreferenceService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PushNotificationService());//------------

}