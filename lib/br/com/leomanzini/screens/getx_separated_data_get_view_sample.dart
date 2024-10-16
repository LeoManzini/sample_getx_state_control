import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/widgets/display_text_data.dart';

// GetView injects the controller (of the kind used) at once in the constructor
// And make it available in the whole class
class GetxSeparatedDataGetViewSample extends GetView<UserController> {
  const GetxSeparatedDataGetViewSample({super.key});

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
            Obx(() => buildTextData('Name: ${controller.user.name}')),
            Obx(() => buildTextData('Age: ${controller.user.age}')),
          ],
        ),
      ),
    );
  }
}
