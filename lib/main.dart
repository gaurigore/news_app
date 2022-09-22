import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/Home.dart';
import 'package:news_app/screen/login.dart';
import 'package:news_app/themes/theme.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp() );
}
 FirebaseAuth _auth=FirebaseAuth.instance;
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
     theme: ThemeData(

        primaryColor:Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:appBar,

       body:_auth.currentUser != null?Home(): Login(),

      )

    );
  }
}

