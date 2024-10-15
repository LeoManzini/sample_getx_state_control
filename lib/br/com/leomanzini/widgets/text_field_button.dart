import 'package:flutter/material.dart';

Widget buildTextField(String labelText, TextEditingController controller, Function()? onTap) {
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