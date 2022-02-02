import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/colors.dart';
import 'package:http/http.dart' as http;

class ApplyLoan extends StatefulWidget {
  ApplyLoan({Key? key}) : super(key: key);

  @override
  _ApplyLoanState createState() => _ApplyLoanState();
}

class _ApplyLoanState extends State<ApplyLoan> {
  var formKey = GlobalKey<FormState>();
  var amount=TextEditingController();
  var currentlyServing=TextEditingController();
  var serviceNumber=TextEditingController();
  var emailAdress=TextEditingController();
  var title=TextEditingController();
  var firstName=TextEditingController();
  var lastName=TextEditingController();
  var postCode=TextEditingController();
  var houseName=TextEditingController();
  var streetName=TextEditingController();
  var town=TextEditingController();
  var country=TextEditingController();
  var phone=TextEditingController();
  var monthlyIcome=TextEditingController();
  var mortgage=TextEditingController();
  var monthlyCreditCard=TextEditingController();
  var other=TextEditingController();
  var food=TextEditingController();
  var transport=TextEditingController();
  var bankName=TextEditingController();
  var bankNumber=TextEditingController();
  var bankSortCode=TextEditingController();
  var referralCode=TextEditingController();
final items =["Yes","No"];
String? value;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset("assets/logo.png",width: 30,height: 30,),
          const  Text("Apply&Loan",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),)
          ],
        ),
        elevation: 1,
        
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
              const  SizedBox(height: 20,),
                
          
          
                
             
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
            
                
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 150,
                          
                          child: TextFormField(
                            
                            controller: amount,
                            validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
                            keyboardType: TextInputType.datetime,
            decoration:const InputDecoration(
            prefix:Text("£") ,
                 //   border: OutlineInputBorder(),
            
            labelText: 'Requested Amount',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
            const   Align(
            alignment: Alignment.bottomLeft,
            child: Text("Currently Serving",style: TextStyle(color: Colors.grey),),),   
                
                   
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: size.width-100,
                          
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey,width: 1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              
                              iconSize: 30,
                              value: value,
                              items: items.map(buildMenuItem).toList(),
                               onChanged: (value)=>setState(() => this.value= value
                            )),
                          ),
                        )
            
                      ),
                ),
                
                
               
               
                
              
          
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          
                          width: 200,
                          child: TextFormField(
                            controller: serviceNumber,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                   // border: OutlineInputBorder(),
            
            labelText: 'Service Number',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
                
                
                
          

                
               
                
                
 
                
                
                
                
                
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: emailAdress,
                                          validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  //  border: OutlineInputBorder(),
            
            labelText: 'Email Adress',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
                  
                
           
            
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: title,
                                    validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  //  border: OutlineInputBorder(),
            
            labelText: 'Title',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
                
                
                
                
              
                 
                 Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: firstName,
                              validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                   // border: OutlineInputBorder(),
            
            labelText: 'Full Name',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          

           
                
                
                
                
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: postCode,
                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  //  border: OutlineInputBorder(),
            
            labelText: 'Post Code',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
                
                
                
                
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: houseName,
                                    validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
            //border: OutlineInputBorder(),
            
            labelText: 'Houser Number/House Code',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
                
                
                
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: streetName,
                                          validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                   // border: OutlineInputBorder(),
            
            labelText: 'Street Name',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
                
                
                
                
                
                Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: town,
                              validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Town',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
          
               Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: country,
                                  validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Country',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
          
          
               Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: phone,
                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            prefix: Text("+44"),
                  
            
            labelText: 'Phone Number',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
               Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: monthlyIcome,
                                  validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Monthly Income',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
               Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: mortgage,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Mortgage/Rent enter 0 if you pay no rent',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller:monthlyCreditCard,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Monthly Credit Card / Loan Commitments',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: other,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Other Regular Expenses',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: food,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Food',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: transport,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Transport',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: bankName,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Bank Name',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: bankNumber,
                                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Bank Account Number',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: bankSortCode,
                                    validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Bank Sort Code',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
                             Align(
            alignment: Alignment.bottomLeft,
            child:   Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: referralCode,
                                        validator: (value){
                              if(value!.isEmpty ){
                                
                                 return "Required";
                              }
                             return null;
                              },
            decoration:const InputDecoration(
            
                  
            
            labelText: 'Referral Code',
            
              ),
            
            ),
            
                        ),
            
                      ),
                ),
          
          
          
              
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: 150,
                            height: 50,
                            
                            decoration:const BoxDecoration(
                              color: Colors.green,
                             
                            borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                            child: OutlineButton(
                              onPressed: ()async{ 
                       bool sonuc = formKey.currentState!.validate();
                       if(sonuc){
FirebaseFirestore.instance.collection("ApplyLoanRequest").doc(FirebaseAuth.instance.currentUser?.uid).set({
  "amount":amount.text,
"currentlyServing":value,
"serviceNumber":serviceNumber.text,
"emailAdress":emailAdress.text,
"title": title.text,
"fullName":firstName.text,
"postCode":postCode.text,
"houseNameHouseNumber": houseName.text,
"streetName": streetName.text,
"town":town.text,
"country":country.text,
"phone":phone.text,
"monthlyIcome": monthlyIcome.text,
"mortgageRent":mortgage.text,
"monthlyCreditCardLoanCommitments": monthlyCreditCard.text,
"otherRegularExpenses":other.text,
"food":food.text,
"transport": transport.text,
"bankName": bankName.text,
"bankAccountNumber": bankNumber.text,
"bankSortCode": bankSortCode.text,
"referralCode": referralCode.text,
"userID": FirebaseAuth.instance.currentUser?.uid,
"check":false,
"status":null
});
                       }else{
Scaffold.of(context).showSnackBar(const SnackBar(content: Text("Operation Failed")));
                       }
                                
                              },
                               color: Colors.green,
                              borderSide:const BorderSide(color: Colors.green),
                              child:const Text("Send", style: TextStyle(color: Colors.white),),
                              shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
                     
                              ),),
          
        const  SizedBox(height: 30,),
                              
               Container(
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade300),
                 width: size.width-20,
                 height: 56.0,
                 //color: Colors.grey.shade300,
                 child: Column(
                   children:const [
                     Icon(Icons.info,color: Colors.green,),
                     Text("""
           You will be informed about your transaction
              """,
              style: TextStyle(color: Colors.grey),
              ),
                   ],
                 ),
               ),
            SizedBox(height: 20,)
          
              ],
            ),
          ),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(value: item,child: Text(item,style: TextStyle(color: Colors.grey),),);
Future sendEmail({
  required String amount,
  required String cureentlyServed,
  required String serviceNumber,
  required String rank,
  required String serviceBranch,
  required String email,
  required String title,
  required String name,
  required String postCode,
  required String houserNumber,
  required String streetName,
  required String town,
  required String country,
  required String phoneNumber,
  required String monthlyIncome,
  required String mortgage,
  required String mCreditCard,
  required String otherRegular,
  required String food,
  required String transport,
  required String bankName,
  required String bankAccountNumber,
  required String bankSortCode,
  required String referralCode



})async{
  final serviceId='service_bqnwfeo';
  final templateId ='template_2re5wlc';
  final userId ='user_8o8BGYruyRUt1Jxghpz1v';
final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
final response = await http.post(url,
headers: {
  'origin': 'http://localhost',
  'Content-Type': 'application/json'},
body:json.encode({
  'service_id':serviceId,
  'template_id': templateId,
  'user_id': userId,
  'template_params':{
   'user_amount': amount
  }
})
);
}
}