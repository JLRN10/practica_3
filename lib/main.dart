import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practica_3/firebase/imagenes_firebase.dart';
import 'package:practica_3/models/images_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ImagenesFirebase? _firebase;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebase = ImagenesFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagesScreen(),
    );
  }
}
