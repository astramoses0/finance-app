import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/colors.dart';
import 'package:finance_app/screens/login.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Card1 extends StatefulWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card1> {
var url = "https://us-central1-forces-finance-service-47caa.cloudfunctions.net/paypalPayment";



      Map<String,dynamic>? paymentIntentData;

var date = DateTime.monthsPerYear;
  @override
  Widget build(BuildContext context) {

    //var size = MediaQuery.of(context).size;
  const style = TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20);
  const styleBig = TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35);
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset("assets/logo.png",width: 30,height: 30,),
      centerTitle: true,
      actions: [
IconButton(icon:const Icon(Icons.exit_to_app_outlined,color: kRedColor,), onPressed: (){
FirebaseAuth.instance.signOut().then((value) {
Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (_)=>const Login()),
(Route<dynamic> route) => false);
});
})
        ],
      ),
      

      body: SafeArea(
      child: SingleChildScrollView(
      child: Column(
      children: [
            const  Center(child: Text("Out Standing Balance",style: style,)),
            const  SizedBox(height: 30,),
              Center(child: Stack(
      children:[
                   Container(
                    width: 220,
                     height: 220,
                     decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(200)),
                     child: Center(
                       child: Container(
                                    width: 200,
                       height: 200,
                       decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(200)),
                         child: Center(child:FutureBuilder<DocumentSnapshot>(
                           future: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).get(),
                           builder: (context,snapshot){
                           if(snapshot.hasError|| snapshot.connectionState==ConnectionState.waiting){
   return Scaffold(
   body: Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
  child:const Center(
 child: CircularProgressIndicator()
       ),
   ),
  );
              }
               return Text("£ "+snapshot.data!["outLoan"].toString(),style: styleBig,);
                           },
                         )
                         )
                         ),
                       ))
                ]
                )
                ),
            const  SizedBox(height: 90,),
FutureBuilder<DocumentSnapshot>(
future: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).get(),
builder: (context,snapshot){
if(snapshot.hasError|| snapshot.connectionState==ConnectionState.waiting){
                return const Scaffold(
   body: Center(
       child: CircularProgressIndicator()
     ),
  );
              }
               return Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 //  Image.network("https://logos-world.net/wp-content/uploads/2021/03/Stripe-Emblem.png",width: 30,height: 30,),
         
       
                   Container(
                        padding:const EdgeInsets.all(5),
                        width: 200,
                        height: 50,
                        
                        decoration:snapshot.data!["outLoan"]==0 ?const BoxDecoration(color: Colors.white): BoxDecoration(
                          color:  snapshot.data!["outLoan"] == 0 ?kStripeEnabledColor  :kStripeColor ,
                        borderRadius:const BorderRadius.all(Radius.circular(40))
                        ),
                        child:snapshot.data!["outLoan"]==0 ? Row(
                          children:const [
                            Icon(Icons.info_outline,color: Colors.green,),
                            SizedBox(width: 10,),
                            Text("You don't owe",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                          ],
                        ): OutlineButton(
                          onPressed: ()async{ 
                           
                           makePPayment();

                          },
                          
                          
            
                          borderSide: BorderSide.none,
                          child:const Text("Make a Payment", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
            
                          ),),
                 ],
               );
                           },
                         ),
                      const   SizedBox(height: 20,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: const[
                           Icon(Icons.info),
                             Text("Your £200 payment will\n  be deducted from your debt.",style:TextStyle(color:Colors.grey,fontFamily:"Oswald",fontWeight: FontWeight.w900)),
                         ],)

    
  
            ],
          ),
        )
      ),

    );
  }




Future<void> makePPayment() async {
    final url = Uri.parse(
        'YOUR FUNCTİONS URL');

    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    this.paymentIntentData = json.decode(response.body);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['paymentIntent'],
            applePay: true,
            googlePay: true,
            style: ThemeMode.dark,
            merchantCountryCode: 'UK',
            merchantDisplayName: 'Forces Finance Service'));
    setState(() {});

    print('initialised');
    try {
      await Stripe.instance.presentPaymentSheet();
      setState(() {
        paymentIntentData = null;
      });
      FutureBuilder<DocumentSnapshot>(
                           future: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).get(),
                           builder: (context,snapshot){
               return snapshot.data?["outLoan"]-200;
            
                           },
                         );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Payment Successful!'),
      ));
      
      FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("payments").add({
        "date": date,
        "amount": "£200",
        "USER ID": FirebaseAuth.instance.currentUser?.uid,
        "method": "card",
        "stripe": true
      });
    } catch (e) {
      print(e);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Canceled'),
      ));
    }
    // await displayPaymentSheet();

  }
 
}