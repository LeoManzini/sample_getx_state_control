import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/user_controller.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/screens/getx_separated_form_samples.dart';

void main() {
  // Inject the controller to general use in the app at once
  // Lazy one just inject in memory when the first call to a controller is made with Get.find<UserController>()
  // Get.lazyPut<UserController>(() => UserController());
  Get.put<UserController>(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: GetxSeparatedFormSamples(),
    );
  }
}
