import 'package:finance_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:finance_app/screens/register2.dart';
import 'package:finance_app/service/firebase_service.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  AuthService firebaseService = AuthService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
 backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            children: [

          
         
              
 
          const    Center(child: Text("Sign In ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40))),
    
      
   const SizedBox(height: 50,),
Container(
  width: 300,
  height: 350,
  decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(30)),
  child: Column(
    children: [
      const SizedBox(height: 30,),

Container(
  width: 250,
  height: 50,
  decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(100)),
  child: TextFormField(
    controller: emailController,
    decoration: InputDecoration(
   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  hintText: "Email Address",
  hintStyle: TextStyle(color: Colors.grey.shade400),

    ),
  )
),
  const  SizedBox(height: 60,),
     
Container(
  width: 250,
  height: 50,
  decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(100)),
  child: TextFormField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  hintText: "Password",
  hintStyle: TextStyle(color: Colors.grey.shade400),

    ),
  )
),
const SizedBox(height: 30,),

Center(
      child: 
                  Container(
                    padding:const EdgeInsets.all(5),
                    width: 200,
                    height: 45,
                    decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: OutlineButton(
                      onPressed: ()async{ 
   
                    try{
  await firebaseService.signIn(emailController.text, passwordController.text)
      .then((value) =>                 Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (_)=>Home()),
                 (Route<dynamic> route) => false));

      
          
}on FirebaseAuthException catch (e){
if(e.code == "invalid-email"){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Email"),
      ));
} if(e.code == "user-not-found"){
    Fluttertoast.showToast(msg: e.message.toString(),backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.TOP);
 
}if(e.code == "wrong-password"){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
 
}

//Fluttertoast.showToast(msg: e.message,backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.TOP);


 

} catch(e){
   Fluttertoast.showToast(msg: e.toString(),backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.TOP);
}
                      },
                       color: Colors.transparent,
                      borderSide:const BorderSide(color: Colors.green),
                      child:const Text("Sign In", style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
             
                      ),),
    ),

    ],
  ),
),
    


  const  SizedBox(height: 60,),
    

 


    Center(
      child: TextButton(
        child:const Text("I dont have a account",style: TextStyle(color: Colors.white),),
        onPressed: (){
Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> Register2()));

        },),
    )
            ],
          ),
        ),
      ),
      
    );
  }
}