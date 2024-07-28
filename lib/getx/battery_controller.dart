import 'package:get/get.dart';

class BatteryController extends GetxController {
  // Observables
  var batteryPercentage = 76.obs;
  var temperature = 39.6.obs;
  var currentCapacity = (-576.0).obs;

  // Battery details
  var technology = 'Li-ion'.obs;
  var tempDetails = '49.1°C'.obs;
  var currentCapacityDetails = '4000 mAh'.obs;
  var voltage = '4.0 V'.obs;
  var status = 'Charging'.obs;

  var sM = 'SM-G965F'.obs;
  var samsung = 'Samsung'.obs;
  var finland = 'Finland'.obs;

  var core1 = '1764 Mhz'.obs;
  var core2 = '1056 Mhz'.obs;
  var core3 = '1254 Mhz'.obs;
  var core4 = '1056 Mhz'.obs;
  var core5 = '1024 Mhz'.obs;

  var utilization = '18%'.obs;
  var cfrequency = '500 MHz'.obs;
  var mfrequency = '750 MHz'.obs;
  var temp = '23°C'.obs;
  var memory = '1007 MB'.obs;
  var gStatus = 'Good'.obs;
}
