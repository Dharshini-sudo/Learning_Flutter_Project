import 'package:flutter/material.dart';
import 'content_screen.dart';

class YearScreen extends StatefulWidget {
  final int startYear;
  final int endYear;
  const YearScreen({this.startYear = 2004, this.endYear = 2025});
  @override
  State<YearScreen> createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  int? selectedYear;
  
  @override 
  // ignore: avoid_types_as_parameter_names
  Widget build(BuildContext context){
    final years = List<int>.generate(
      widget.endYear - widget.startYear + 1,
      (index) => widget.endYear - index,
    );
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(16),
        
        child: Column(
          children: [
            Container( 
              height: 84,
              width:357,
              
            
               child:Row( children: [
                Container(
                width: 32,
                height: 32,
                
                child:Icon(Icons.chevron_left, size: 35, ),
                
               ),
               ],  

                 ),
            
            
            
            ),
            SizedBox(height: 1,),
            Positioned( 
              top:120,
              left:16,
            
              child:Container(  
                width: 300,
                height: 24,
              
               alignment: Alignment.center,
                child: Text(
                   " Son adet tarihinizi seçiniz",
                    style: TextStyle( 
                    fontFamily: 'Renogare',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height:24/20,
                    color: Colors.black,
                     ),
                     textAlign: TextAlign.center,
              
                ),
              ),
            ), 

            SizedBox( height: 10,),

            
              Row( 
                
                mainAxisAlignment: MainAxisAlignment.start, 
                
                children: [
                  Container(  
                    padding: EdgeInsets.only(left: 10),
                    child: Text( 'Yıl',style: TextStyle(  fontFamily:'Nonita',fontSize: 16, fontWeight: FontWeight.w700,height: 20/16),),

                  ) 
                  
                  
                ],
              ),
            
            Expanded(
              child: GridView.builder(
                itemCount: years.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

                itemBuilder: (context, index) {
                  final year = years[index];
                  final isSelected = year == selectedYear; 
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedYear = null;
                        } else {
                          selectedYear = year;
                        }
                        

                      });
                    },
                    child: buildCalendarYear(year, isSelected),

                  ); 
                  
                },
              ),  
            
                      
            ),
            SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: selectedYear != null
                        ? () {
                            Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => ContentScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedYear != null ? Color(0xFFEC617A) : Colors.grey.shade400,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
                      side: BorderSide(width: 1 ,color: Colors.white), 
                    ),
                    child: Text(
                      "Kaydet",
                      style: TextStyle(
                        color: selectedYear != null ? Colors.white : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ]  
        )   
      )
    );
  
    
   
  }
  Widget buildCalendarYear(int year, bool isSelected){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$year',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,fontFamily: 'Poppins',height: 20/16),
        ),
        const SizedBox(height: 4),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFEC617A) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Color(0xFFEC617A) : Colors.black26,
            ),
          ),
          child: isSelected ? Icon(Icons.check, color: Colors.white, size: 16) : null,
        ),
      ],
    );
  }
}

  

  