import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class StateHoldersBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}