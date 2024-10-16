import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/widgets/display_text_data.dart';

class GetxSeparatedDataSamples extends StatelessWidget {
  GetxSeparatedDataSamples({super.key});

  // How to search on the controller you injected earlier
  final UserController _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Obx(() => buildTextData('Name: ${_userController.user.name}')),
            // When using getx, you can not use init state here if you already have a controller
            // of same kind as needed injected earlier
            GetX<UserController>(
              builder: (controller) {
                return buildTextData('Age: ${_userController.user.age}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
