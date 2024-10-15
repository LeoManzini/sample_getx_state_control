import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';

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
            Obx(() => _buildTextData('Name: ${_userController.user.name}')),
            Obx(() => _buildTextData('Age: ${_userController.user.age}')),
            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),
            _buildTextField('Name', _nameController, () {
              _userController.setUserName(_nameController.text);
            }),
            const SizedBox(height: 10),
            _buildTextField('Age', _ageController, () {
              _userController.setUserAge(int.parse(_ageController.text));
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTextData(String displayName) {
    return Text(
      displayName,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller, Function()? onTap) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
