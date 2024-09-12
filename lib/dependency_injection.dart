import 'package:get/get.dart';
import 'package:thichxemphim/controller/network_controller.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/screens/home_screen/controller/home_controller.dart';

class DependencyInjection {
  static void init() {
    configureDependencies();
    //Get.lazyPut<HomeController>(() => HomeController());
    Get.put<NetworkController>(
      NetworkController(),
      permanent: true,
    );
  }
}
