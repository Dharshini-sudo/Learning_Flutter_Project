import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=>HomeScreen()),);
    });
  }
  Widget build(BuildContext context){
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Center(  
        child:Image.asset('assets/image.png',width:150),
      ),
    );
  }
}