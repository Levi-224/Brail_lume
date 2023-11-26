// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';

Future<String?> numericAction(
  String digit,
  String columnname,
) async {
  // check firestore 'numbers' for 'digit' and return content of argument 'columnname'

  await Firebase.initializeApp();
  var firestore = FirebaseFirestore.instance;
  var querySnapshot = await firestore
      .collection('numbers')
      .where('Digit', isEqualTo: digit)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    var documentSnapshot = querySnapshot.docs.first;
    return documentSnapshot.get(columnname);
  } else {
    return "No matching sentence found";
  }
}
