import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/widgets/display_text_data.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/widgets/text_field_button.dart';

class GetxFormSamples extends StatelessWidget {
  GetxFormSamples({super.key});

  final UserController _userController = UserController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Obx(() => buildTextData('Name: ${_userController.user.name}')),
            Obx(() => buildTextData('Age: ${_userController.user.age}')),
            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),
            buildTextField('Name', _nameController, () {
              _userController.setUserName(_nameController.text);
            }),
            const SizedBox(height: 10),
            buildTextField('Age', _ageController, () {
              _userController.setUserAge(int.parse(_ageController.text));
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
