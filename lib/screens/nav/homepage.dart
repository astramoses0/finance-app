import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        FirebaseAuth firebaseAuth= FirebaseAuth.instance;
        FirebaseFirestore firestore = FirebaseFirestore.instance;
     //// String url = "https://forcesfinanceservice.files.wordpress.com/2021/09/cropped-cropped-f-logo-loan-mine-11.png";
      //  var size = MediaQuery.of(context).size;
//const myStyle = TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Oswald");
    return Scaffold(
      
body: SafeArea(
  child:   Column(
  
    children: [
  
      Row(
  
        children: [
  
          Image.asset("assets/logo.png",width: 50,height: 50,),
        const   SizedBox(width: 50),
       const    Align(
            alignment:   Alignment.center,
            child:  Text("Home / Overview", style: TextStyle(fontWeight: FontWeight.bold),)),
            
  
        ],
  
    ),
     SizedBox(height: 100,),
Stack(
     
     children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(200)),
          height: 250,
          width: 250,
          child: Center(
            child:                 Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(200)),
          height: 230,
          width: 230,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const   Text("Current Loan",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,),),
                             StreamBuilder<DocumentSnapshot>(
                  stream: firestore.collection("Users").doc(firebaseAuth.currentUser?.uid).snapshots(),

                  builder: (context,snapshot){
                                 if(snapshot.hasError|| snapshot.connectionState==ConnectionState.waiting){
                return const  Scaffold(
   body: Center(
       child: CircularProgressIndicator()
     ),
  );
              }
                    if(snapshot.hasData== null || snapshot.connectionState==ConnectionState.waiting || snapshot.hasData== ConnectionState.none) Text("Please Wait");
                    return  Text("£"+snapshot.data!["currentLoan"].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,),);
                  })
                
            ],),
          ),
        ),
          ),
        ),

     ],
   ),
 
  
    ],
  
  ),
),
      
     

    );
  }
}