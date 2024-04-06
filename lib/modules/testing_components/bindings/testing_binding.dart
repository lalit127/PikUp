import 'package:pikup_app/modules/testing_components/controller/testing_controller.dart';
import 'package:get/get.dart';

class TestingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestingController>(
      () => TestingController(),
    );
  }
}
