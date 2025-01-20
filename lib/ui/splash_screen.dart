import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState()=>SplashScreenState();
} 
class SplashScreenState extends State<SplashScreen>{
  @override
 Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const Color(0xFFFF5858),
     body:Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
   
        children: [
         
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
          width:50,
          height:50,
          decoration:   const BoxDecoration(
             color:  Colors.white,
             borderRadius:  BorderRadius.all(Radius.circular(20))
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
    );
  }
}

 