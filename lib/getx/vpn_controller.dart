import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class VPNController extends GetxController {
  RxString connectionStatus = 'Connected'.obs;
  RxString timer = '00:00:49'.obs;

  void changeStatus(String status) {
    connectionStatus.value = status;
  }

  void changeTimer(String newTimer) {
    timer.value = newTimer;
  }
}
