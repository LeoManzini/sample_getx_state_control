import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_getx_state_control/value_controller.dart';

void main() {
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
      home: MyStatelessHomePage(),
    );
  }
}

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
            TextField(
              controller: _textController,
            ),
            GetBuilder<ValueController>(
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

class MyStatefulHomePage extends StatefulWidget {
  const MyStatefulHomePage({super.key});

  @override
  State<MyStatefulHomePage> createState() => _MyStatefulHomePageState();
}

class _MyStatefulHomePageState extends State<MyStatefulHomePage> {
  String _definedValue = '';
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Defined value: $_definedValue',
            ),
            TextField(
              controller: _textController,
            ),
            ElevatedButton(
              onPressed: () {
                String value = _textController.text;
                // Set state rebuilds this entire component marked as @build just for a refresh on a text field
                setState(() {
                  _definedValue = value;
                });
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
