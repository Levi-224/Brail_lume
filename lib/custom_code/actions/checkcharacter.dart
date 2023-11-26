// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> checkcharacter(String input) async {
  print('Checking for character');
  // check if the given string is a letter, a number or a special character
  if (input.isEmpty) {
    return "Empty string";
  } else if (input.contains(new RegExp(r'[0-9]'))) {
    return "Number";
  } else if (input.contains(new RegExp(r'[A-Z]'))) {
    return "Letter";
  } else {
    return "Special character";
  }
}
