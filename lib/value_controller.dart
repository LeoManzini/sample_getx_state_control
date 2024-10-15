import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ValueController extends GetxController {
  String _definedValue = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get definedValueGet => _definedValue;

  Future<void> setDefinedValue(String value) async {
    _isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 3));
    _definedValue = value;
    _isLoading = false;
    update();
  }
}