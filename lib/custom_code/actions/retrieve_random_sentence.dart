// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import "dart:math";

Future<String?> retrieveRandomSentence(
  String letter,
  String ageGroup,
  String country,
  String columnname,
) async {
  // select and return a sentence randomly from 'columnname' based on arguments from firebase sentences
// Initialize Firebase
  await Firebase.initializeApp();

// Get reference to the sentences collection
  final sentencesRef = FirebaseFirestore.instance.collection('letter_info');
  print('Fetching documents');
// Build the query based on the arguments
  Query query = sentencesRef.where('Letter', isEqualTo: letter);
  query = query.where('AgeGroup', isEqualTo: ageGroup);
  query = query.where('Country', isEqualTo: country);

// Get the documents that match the query
  final snapshot = await query.get();

  if (snapshot.docs.isEmpty) {
    // No documents matched
    return "No matching sentence found";
  }
// Get the sentences from the documents
  // Get the sentences from the documents
  // Get the sentences from the documents
  else {
    final sentences = snapshot.docs
        .map((doc) =>
            (doc.data() as Map<String, dynamic>)['$columnname'] as String?)
        .toList();

    // Select a random sentence from the list
    final random = Random();
    final index = random.nextInt(sentences.length);
    String? sentence = sentences[index];
    print('returning fetched sentence');
    return sentence;
  }
}
