import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBOkOBXl6hsBqx9w0pgQBKu8pZF6vB-jvs",
            authDomain: "fffirebase-e68c2.firebaseapp.com",
            projectId: "fffirebase-e68c2",
            storageBucket: "fffirebase-e68c2.appspot.com",
            messagingSenderId: "1017316502077",
            appId: "1:1017316502077:web:0d1a366a4512340928d854"));
  } else {
    await Firebase.initializeApp();
  }
}
