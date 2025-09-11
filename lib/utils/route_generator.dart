
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lyft_admin/screens/drivers/driver_screen.dart';
import 'package:lyft_admin/screens/rides/ride_screen.dart';
import 'package:lyft_admin/screens/users/user_screen.dart';
import 'package:lyft_admin/utils/screen_bindings.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/auth/send_otp_screen.dart';
import '../screens/auth/set_new_pass.dart';
import '../screens/auth/verify_otp_screen.dart';
import '../screens/dashboard_screen/dashboard_screen.dart';
import '../screens/support/support_screen.dart';
import '../screens/vehicle_settings/vehicle_settings.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kAuthScreenRoute, page: () => AuthScreen(), binding: ScreenBindings(),),
      GetPage(name: kSendOtpScreenRoute, page: () => SendOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kVerifyOtpScreenRoute, page: () => VerifyOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kSetNewPassScreenRoute, page: () => SetNewPassScreen(), binding: ScreenBindings(),),
      GetPage(name: kDashboardScreenRoute, page: () => DashboardScreen(), binding: ScreenBindings(),),
      GetPage(name: kUserScreenRoute, page: () => UserScreen(), binding: ScreenBindings(),),
      GetPage(name: kDriverScreenRoute, page: () => DriverScreen(), binding: ScreenBindings(),),
      GetPage(name: kRideScreenRoute, page: () => RideScreen(), binding: ScreenBindings(),),
      GetPage(name: kSupportScreenRoute, page: () => SupportScreen(), binding: ScreenBindings(),),
      GetPage(name: kVehicleSettingsScreenRoute, page: () => VehicleSettingsScreen(), binding: ScreenBindings(),),
       ];
  }
}

