import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB8tglr5MIYrGgXM3E7eGL_vstAco38f9U",
            authDomain: "databasegg-6925d.firebaseapp.com",
            projectId: "databasegg-6925d",
            storageBucket: "databasegg-6925d.appspot.com",
            messagingSenderId: "961414409348",
            appId: "1:961414409348:web:0d4f6e4aa16eda37c0a6d1"));
  } else {
    await Firebase.initializeApp();
  }
}
