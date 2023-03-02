import '/client_id/Common_url_service_provider.dart';
import '/login/login_page_service_provider.dart';
import '/pushnotifications/notifications_provider.dart';
import '/registration/mobile_registration_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CommonUrlServiceProvider>(CommonUrlServiceProvider());
  getIt.registerSingleton<LoginPageServiceProvider>(LoginPageServiceProvider());
  getIt.registerSingleton<MobileRegistrationProvider>(
      MobileRegistrationProvider());

  getIt.registerSingleton<NotificationProvider>(NotificationProvider());
}
