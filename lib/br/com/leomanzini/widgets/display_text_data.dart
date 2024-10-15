import 'package:flutter/material.dart';

Widget buildTextData(String displayName) {
  return Text(
    displayName,
    style: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  );
}