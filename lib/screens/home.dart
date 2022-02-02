import 'package:finance_app/screens/nav/app_loan.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:finance_app/screens/nav/card.dart';
import 'package:finance_app/screens/nav/homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
int currentIndex =0;
  List listOfPages=[
             
            
             const HomePage(),   
              ApplyLoan(),
           const  Card1()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        

      
      body: listOfPages[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        iconSize: 20,
        backgroundColor: Colors.white,
        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
                      currentIndex = index;
                    });
                  
        },
        items: <BottomNavyBarItem>[

            BottomNavyBarItem(
            icon:const Icon(Icons.home,size: 25,),
            title:const Text("Home"),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent
          ),


         BottomNavyBarItem(
            icon:const Icon(Icons.pending_actions_rounded,size: 25,),
            title:const Text("Apply Loan"),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent
          ),




          

                BottomNavyBarItem(
            icon:const Icon(Icons.credit_card,size: 25,),
            title:const Text("Card"),
            activeColor:  Colors.greenAccent,
            
            inactiveColor: Colors.greenAccent
          ),

        ],
      ),
    );
  }
}