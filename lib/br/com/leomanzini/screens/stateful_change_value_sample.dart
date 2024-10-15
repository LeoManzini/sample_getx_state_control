import 'package:flutter/material.dart';

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