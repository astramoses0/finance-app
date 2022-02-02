import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/screens/login.dart';
import 'package:finance_app/service/firebase_service.dart';

class Register2 extends StatefulWidget {
 
 const Register2({Key? key,}) : super(key: key);

  @override
  _Register2State createState() => _Register2State();
}

                TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  AuthService firebaseService = AuthService();
  var formKey= GlobalKey<FormState>();
class _Register2State extends State<Register2> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
             const Center(child: Text("Register ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40))),
           const SizedBox(height: 30,),
            Container(
width: 300,
height: 350,
decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
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


const SizedBox(height: 60,),


Container(
  width: 250,
  height: 50,
  decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(100)),
  child: TextFormField(
    controller: passwordController,
    decoration: InputDecoration(
   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  hintText: "Password",
  hintStyle: TextStyle(color: Colors.grey.shade400),

    ),
  )
),

const SizedBox(height: 12,),




          
              Center(
                child: 
                    Container(
                      padding:const EdgeInsets.all(5),
                      width: 250,
                      height: 50,
                      decoration:const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: OutlineButton(
                        onPressed: ()async{ 
                          bool sonuc = formKey.currentState!.validate();
                          if(sonuc){
                              firebaseService.signUp(
                      emailController.text,
                       passwordController.text,

                               ).then((value) => Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>Login())));
                          
                          }
                   
                          
                        },
                         color: Colors.transparent,
                        borderSide:const BorderSide(color: Colors.green),
                        child:const Text("Sign Up", style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                        shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
               
                        ),),
              ),
          
          
            const  SizedBox(height: 50,),
          
          
              Center(
                child: TextButton(
                  child:const Text("I have a account",style: TextStyle(color: Colors.white),),
                  onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
          
                  },),
              ),
  ],
),
            ),
                   
    
              const  SizedBox(height: 10,),
                      
          
          
           const   SizedBox(height: 20,),

              
               Container(
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade300),
                 width: size.width-20,
                 height: 100,
                 //color: Colors.grey.shade300,
                 child: Column(
                   children:const [
                     Icon(Icons.info,color: Colors.green,),
                     Text("""
            Enter your information without errors. Pay attention to gaps, missing fields. Otherwise, Your Loan Application May Be Rejected
              """,
              style: TextStyle(color: Colors.grey),
              ),
                   ],
                 ),
               ),
           const     SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

}
