import 'package:get/get_common/get_reset.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ValueController extends GetxController {
  // To create observable variables, with getx you need to init the value
  // uses the Rx type and .obs to create an observable
  String _definedValue = '';
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  String get definedValueGet => _definedValue;

  Future<void> setDefinedValue(String newValue) async {
    _isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    _definedValue = newValue;
    update();
    _isLoading.value = false;
  }
}