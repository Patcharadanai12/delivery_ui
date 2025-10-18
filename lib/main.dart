//import 'package:deliver_tracksure/firebase_options.dart';
import 'package:flutter/material.dart';
//import 'pages/all.dart';
import 'pages/login.dart';
//import  'pages/products.dart';


Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized(); 

   //เริ่มต้น Firebase
  //await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  //);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deliver TrackSure',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(), // ตั้งค่าให้หน้าเริ่มต้นเป็นหน้า Indexpage
    );
  }
}
