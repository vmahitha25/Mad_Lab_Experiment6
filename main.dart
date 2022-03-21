import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'realtime_db.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBi2MgbEJo3fNKrPuwMRNSqzXomUCBJbg8",
      authDomain: "mad-lab-experiment-6-621ae.firebaseapp.com",
      databaseURL: "https://mad-lab-experiment-6-621ae-default-rtdb.firebaseio.com/",
      projectId: "mad-lab-experiment-6-621ae",
      storageBucket: "mad-lab-experiment-6-621ae.appspot.com",
      messagingSenderId: "480373101038",
      appId: "1:480373101038:web:2b005b6c28d8ebeec0beff"),
  );
  runApp(const MaterialApp(
    home: realtime_db(),
  ));
}