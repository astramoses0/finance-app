import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:finance_app/splash.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   
  Stripe.publishableKey = "YOUR PUBLİSHABLE KEY (PK_LİVE)";
   Stripe.merchantIdentifier ='any string works';
   await Stripe.instance.applySettings();


 // );
  FirebaseApp app =await Firebase.initializeApp();
 
   SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitDown,
  DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.green,
        primaryColor: Colors.black
      ),
      home: Splash(),
    );
  }
}

