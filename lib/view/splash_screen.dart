import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rebuy/view/login_screen.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState()=>_SplashScreenState();
} 
class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
    });
  }
  @override
 Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const Color(0xFFFF5858),
      
     body:Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
              colors: [Color(0xFFFF5858), Color(0xFFF857A6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
       ),
      child:Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
   
        children: [
         
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
          width:130,
          height:130,
          decoration:   const BoxDecoration(
             color:  Colors.white,
             
             borderRadius:  BorderRadius.all(Radius.circular(150))
          ),
          child:Padding(
            padding:const EdgeInsets.all(9),
            child: Image.asset('assets/images/logo.png'),

          )
         
         ),
          ],
        ),
        
          
        ],
     ),
     ),
    );
  }
}

 