// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

void displaySnackBar(context, bool success, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 16),
    backgroundColor: success ? Colors.green : Colors.red,
    content: Text(text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'Ok',
      onPressed: () {
        print("OK");
      },
    ),
  ));
}
