import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/screens/getx_separated_data_samples.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/widgets/text_field_button.dart';

class GetxSeparatedFormSamples extends StatelessWidget {
  GetxSeparatedFormSamples({super.key});

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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetxSeparatedDataSamples()));
              },
              child: const Text('Data screen'),
            ),
          ],
        ),
      ),
    );
  }
}
