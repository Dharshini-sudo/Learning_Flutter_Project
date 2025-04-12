import 'package:flutter/material.dart';
import 'next_screen.dart';

class HomeScreen extends StatelessWidget{
  get animation => null;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
       
      home: Scaffold(
        backgroundColor: Colors.white,  
        
        body:Column(  
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child:Positioned(
                top:80,
                left:36,
                child: Image.asset('assets/image.png',width:304,height:304),) ,
            ),
            SizedBox(height: 10,),

            Container( 
              width:343,
              height:24,
              alignment: Alignment.center,
              // ignore: prefer_const_constructors
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                
                
                Text("MomyApp",style: TextStyle(
                  fontFamily: 'Renogare',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Colors.pink,),),
                SizedBox(width: 3),
                Text("Hoşgeldiniz!",style: TextStyle(
                  fontFamily: 'Renogare',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Colors.black)),

              ],),
              

            ) ,
            SizedBox( height:20,),
            Container(
              width: 343,
              height: 54,
              alignment: Alignment.center,
              child:Text(
                "Gizliliğinize değer veriyoruz. Hamilelik yolculuğunuzda size en iyi deneyimi sunmak için devam edin.", 
                textAlign: TextAlign.center,
                style: TextStyle(  
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height:18/14,
                  color: Colors.black,
                ),
              ), 
              

            ),
            SizedBox(height: 20,),
            Container(
              child:Column(children: [
                SizedBox( 
                  width: 343,
                  height: 48,
                  child:ElevatedButton(
                    onPressed: (){   
                      Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => NextScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
                    },
                    style:ElevatedButton.styleFrom(  
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape:RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(8),
                        side:BorderSide(color: Colors.black,width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.apple,size:24,color:Colors.black),
                        SizedBox(width:7),
                        Text( "Apple",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),)
                      ], ),

                  ),
                ),
                SizedBox(height: 10,),
                SizedBox( 
                  width: 343,
                  height: 48,
                  child:ElevatedButton(
                    onPressed: (){ 
                      Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => NextScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
                    },
                    style:ElevatedButton.styleFrom(  
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape:RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(8),
                        side:BorderSide(color: Colors.black,width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.g_mobiledata,size:30,color:Colors.blueAccent),
                        SizedBox(width:7),
                        Text( "Google",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),)
                      ], ),

                  ),
                ),
                SizedBox(height: 10,),
                SizedBox( 
                  width: 343,
                  height: 48,
                  child:ElevatedButton(
                    onPressed: (){  
                      Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => NextScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
                    },
                    style:ElevatedButton.styleFrom(  
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape:RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(8),
                        side:BorderSide(color: Colors.black,width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Icon(Icons.email,size:24,color:Colors.blue),
                        SizedBox(width:7),
                        Text( "Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),)
                      ], ),

                  ),
                ),
              ],)
            )
            
          ],
        )
      ),
    );
      
      
    
  }
}

