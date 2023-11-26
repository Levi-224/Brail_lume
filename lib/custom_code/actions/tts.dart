// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:flutter_tts/flutter_tts.dart';

Future tts(
  String language,
  String text,
  double speed,
  int repeatCount,
  int voicegender,
) async {
  // text to speech. Voice selected by country and voicegender. speed,repetition set from arguments
  FlutterTts flutterTts = FlutterTts();
  await flutterTts.setSpeechRate(speed);

  // Set speech rate
  // Set voice
  if (language == 'India') {
    if (voicegender == 0) {
      var lan = "en-IN";
      await flutterTts.setLanguage('en-IN');
      var isLanguageAvailable = await flutterTts.isLanguageAvailable(lan);
      if (isLanguageAvailable) {
        for (int i = 0; i < repeatCount; i++) {
          await flutterTts
              .setVoice({"name": "en-in-x-ind-local", "locale": "en-IN"});
          await flutterTts.setPitch(0.5);
          print('Starting to speak');
          await flutterTts.speak(text);
          await flutterTts.awaitSpeakCompletion(true);
          print('spoken');
        }
      } else {
        print('Selected language not available in your device');
      }
    } else if (voicegender == 1) {
      var lan = "en-IN";
      await flutterTts.setLanguage('en-IN');
      var isLanguageAvailable = await flutterTts.isLanguageAvailable(lan);
      if (isLanguageAvailable) {
        for (int i = 0; i < repeatCount; i++) {
          await flutterTts
              .setVoice({"name": "en-in-x-ica-local", "locale": "en-IN"});
          await flutterTts.setPitch(1.5);
          print('Starting to speak');
          await flutterTts.speak(text);
          await flutterTts.awaitSpeakCompletion(true);
          print('spoken');
        }
      } else {
        print('Selected language not available in your device');
      }
    }
  } else if (language == 'UK') {
    if (voicegender == 0) {
      var lan = "en-GB";
      await flutterTts.setLanguage(lan);
      var isLanguageAvailable = await flutterTts.isLanguageAvailable(lan);
      if (isLanguageAvailable) {
        for (int i = 0; i < repeatCount; i++) {
          await flutterTts
              .setVoice({"name": "en-gb-x-gbd-local", "locale": "en-GB"});
          await flutterTts.setPitch(0.5);
          print('Starting to speak');
          await flutterTts.speak(text);
          await flutterTts.awaitSpeakCompletion(true);
          print('spoken');
        }
      } else {
        print('Selected language not available in your device');
      }
    } else if (voicegender == 1) {
      var lan = "en-GB";
      await flutterTts.setLanguage(lan);
      var isLanguageAvailable = await flutterTts.isLanguageAvailable(lan);
      if (isLanguageAvailable) {
        for (int i = 0; i < repeatCount; i++) {
          await flutterTts
              .setVoice({"name": "en-gb-x-gbc-local", "locale": "en-GB"});
          await flutterTts.setPitch(1.5);
          print('Starting to speak');
          await flutterTts.speak(text);
          await flutterTts.awaitSpeakCompletion(true);
          print('spoken');
        }
      } else {
        print('Selected language not available in your device');
      }
    }
  }

  // Repeat text

  // Cleanup
  flutterTts.stop();
  print('stopped');
}
