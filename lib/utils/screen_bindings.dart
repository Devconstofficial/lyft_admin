import 'package:get/get.dart';
import 'package:lyft_admin/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:lyft_admin/screens/rides/controller/ride_controller.dart';
import 'package:lyft_admin/screens/support/controller/support_controller.dart';
import 'package:lyft_admin/screens/vehicle_settings/controller/settings_controller.dart';
import '../screens/auth/controller/auth_controller.dart';
import '../screens/drivers/controller/driver_controller.dart';
import '../screens/users/controller/user_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => DriverController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => RideController());
    Get.lazyPut(() => SupportController());
    Get.lazyPut(() => VehicleSettingsController());
  }
}
