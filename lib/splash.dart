import 'package:flutter/material.dart';
import 'package:finance_app/screens/login.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  String url="https://forcesfinanceservice.files.wordpress.com/2021/09/cropped-cropped-f-logo-loan-mine-11.png";
@override
void initState() {
  super.initState();
  Future.delayed(
   const Duration(seconds: 5),(){
Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
    }
  );
}
  @override
  Widget build(BuildContext context) {
    
   // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
   Align(
     alignment: Alignment.center,
              child: Container(
                
                width: 150,
                height: 150,
                decoration: BoxDecoration(
    
                 // color: Colors.white,
                  borderRadius: BorderRadius.circular(50)),
                child:  Container(
         
                  child: Image.asset("assets/logo.png",width: 20,height: 20,)),
              ),
            ),
         // SizedBox(height: size.height),
       const    Align(
           alignment: Alignment.bottomCenter,
            child: Text("Finance App",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}