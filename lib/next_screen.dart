import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class NextScreen extends StatefulWidget {
  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Different background color
      body: Column(children: [ 
        Padding(
          padding: EdgeInsets.only(top: 124,left:24),
          child: Container( 
            
            width: 343,
            height: 72,
            alignment: Alignment.center,
            child: Text(  
              "Sizi daha yakından tanımak isteriz, lütfen hangi dönemde olduğunuzu seçin",
              textAlign: TextAlign.center,
              style:TextStyle(  
                fontFamily: "Renogare",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.2,
                color: Colors.black,
              ),
            ), 
        
          ),
          

        ),
        SizedBox(height: 5,),
        Container( 
          padding:EdgeInsets.only(left:24),
          width: 343,
          height: 36,
          alignment: Alignment.center,
          child:Text("Size en uygun içerikleri sunabilmemiz için bu bilgiye ihtiyaç duyuyoruz.",
                      textAlign: TextAlign.center,
                      style: TextStyle( 
                        fontSize: 14,
                        height: 18/14,
                        color: Colors.black,
                      ),),
        ),
        
        SizedBox(height: 80,),
        Padding(
          padding: EdgeInsets.only(left:24),
          
          child: SizedBox( 
            
            width: 343, height:56,
            child: ElevatedButton(
              onPressed: (){  
                Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => CalendarScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
              },
              style:ElevatedButton.styleFrom(  
                backgroundColor: Colors.white,
                foregroundColor: Colors.pink,
                shape:RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(8),
                  side:BorderSide(color: Colors.pink,width:1),
                ),
                
              ),
              child: Text(
                "Hamileliğe hazırlanıyorum",
                style: TextStyle( 
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 18,),
        Padding(
          padding: EdgeInsets.only(left:24),
          
          child: SizedBox( 
            
            width: 343, height:56,
            child: ElevatedButton(
              onPressed: (){  
                Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => CalendarScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
              },
              style:ElevatedButton.styleFrom(  
                backgroundColor: Colors.white,
                foregroundColor: Colors.pink,
                shape:RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(8),
                  side:BorderSide(color: Colors.pink,width:1),
                ),
                
              ),
              child: Text(
                "Hamileyim",
                style: TextStyle( 
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 18,),
        Padding(
          padding: EdgeInsets.only(left:24),
          
          child: SizedBox( 
            
            width: 343, height:56,
            child: ElevatedButton(
              onPressed: (){   
                Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => CalendarScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
              },
              style:ElevatedButton.styleFrom(  
                backgroundColor: Colors.white,
                foregroundColor: Colors.pink,
                shape:RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(8),
                  side:BorderSide(color: Colors.pink,width:1),
                ),
                
              ),
              child: Text(
                "Çocuğumu büyütüyorum",
                style: TextStyle( 
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],)
    );
  }
}
