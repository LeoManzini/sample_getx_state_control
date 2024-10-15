import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sample_getx_state_control/br/com/leomanzini/controllers/change_value_controller.dart';

class MyStatelessHomePage extends StatelessWidget {
  MyStatelessHomePage({super.key});

  final ValueController _valueController = ValueController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<ValueController>(
              // Init controller value, creates a new instance for single use or use the same from class
              init: _valueController,
              // Called every time the widget is rebuilt
              // initState: (_) {},
              // Builder receives a controller instance as parameter
              builder: (_) {
                return Text(
                  'Defined value: ${_valueController.definedValueGet}',
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: _textController,
              ),
            ),
            // Use GetX with observable builder for observable variable
            // Or you could use Obx for observable variables
            // Obx does not declare a controller, because you need a existing one (external and not scoped)
            // In cases you need to use in multiple places
            Obx(() {
              return _valueController.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  _valueController.setDefinedValue(_textController.text);
                },
                child: const Text('Confirm'),
              );
            }),
            GetX<ValueController>(
              init: _valueController,
              builder: (controller) {
                return controller.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    _valueController.setDefinedValue(_textController.text);
                  },
                  child: const Text('Confirm'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}