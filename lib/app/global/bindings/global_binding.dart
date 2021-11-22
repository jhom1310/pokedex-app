import 'package:get/instance_manager.dart';
import 'package:pokedex/app/global/controllers/global_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(), permanent: true);
  }
}
