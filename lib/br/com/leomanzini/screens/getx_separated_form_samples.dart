import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/screens/getx_separated_data_samples.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/widgets/text_field_button.dart';

class GetxSeparatedFormSamples extends StatelessWidget {
  GetxSeparatedFormSamples({super.key});

  // How to search on the controller you injected earlier
  // final UserController _userController = Get.find<UserController>();
  // When explicitly declared controller type does not need to use the Get.find<Type>()
  final UserController _userController = Get.find();
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
            buildTextField('Name', _nameController, () {
              _userController.setUserName(_nameController.text);
            }),
            const SizedBox(height: 10),
            buildTextField('Age', _ageController, () {
              _userController.setUserAge(int.parse(_ageController.text));
            }),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Getx go to another screen, nut need to change main screen widget
                // from MaterialApp to GetMaterialApp, uses with anonymous function (to a better performance)
                Get.to(() => GetxSeparatedDataSamples());
                // Syntax to navigate back with GetX Get.back();
                // To pass value to another screen from the one is being closed use Get.back(result: 'value');
                // To receive this value from a Get.back use final result = await Get.to(() => GetxSeparatedDataSamples());
                // Get.toNamed('/data'); to use named routes with GetX
              },
              child: const Text('Data screen'),
            ),
          ],
        ),
      ),
    );
  }
}
