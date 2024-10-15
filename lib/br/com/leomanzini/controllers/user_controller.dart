import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/models/user_model.dart';

class UserController extends GetxController {
  // Creating an observable variable from a class
  final Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  void setUserName(String name) {
    // Observable variable updating attribute from value, not the entire value (obx.value = value, still working to replace the object value)
    // _user.value.name = name not updates the entire '.value' so it not refresh on screen
    _user.update((user) {
      user?.name = name;
    });
  }

  void setUserAge(int age) {
    // This way works similar, but it updates the only a '.value' attribute and tell the interface to refresh
    _user.value.age = age;
    _user.refresh();
  }
}