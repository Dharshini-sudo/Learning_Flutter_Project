import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dobYear.dart';
class ContentScreen extends StatefulWidget{
  @override
  State<ContentScreen>createState() =>  _ContentScreen();
}
class _ContentScreen extends State<ContentScreen>{
  DateTime? selectedDate;
  DateTime focusedMonth = DateTime.now();
  
  
  @override
  Widget build(BuildContext context){
    final List<DateTime?> calendarDays=_generateCalendarDays(focusedMonth);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:Column(
          children: [
            Container(
              height: 84,
              width:357,
              child: Row( 
                children: [ 
                  Container(
                    width: 32,
                    height: 32,
                    child: Icon(Icons.chevron_left,size: 35,),
                  ),
                ] ,
              ),
            ),
            SizedBox(height: 1,),
            Center(
              child: Container(
                width: 343,
                height: 48,
                child: Text(" Bebeğinizin doğum tarihini giriniz", style: TextStyle( fontFamily: 'Renogare',fontSize: 20,fontWeight: FontWeight.w400,height: 24/20),textAlign: TextAlign.center, ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                  
                  IconButton(
                    icon: Icon(Icons.chevron_left,),
                    iconSize: 24,
                    onPressed: () {
                      setState(() {
                        focusedMonth=DateTime(focusedMonth.year,focusedMonth.month-1);
                      });
                      
                    },
                  ),
                
                
                Expanded(
                  child: Text(
                    DateFormat.yMMMM('tr_TR').format(focusedMonth),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Poppins',height: 20/16),
                  ),
                ),
                
                
                focusedMonth.year<DateTime.now().year || 
                (focusedMonth.year==DateTime.now().year && focusedMonth.month<DateTime.now().month) 
                ? 
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed:(){
                    setState(() {
                    focusedMonth=DateTime(focusedMonth.year,focusedMonth.month+1 );
                    });

                  },
                )
                : SizedBox( width: 30,),

                
                
                
              ],
            ),
            SizedBox(height: 10,),
            Row(  
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['PZT', 'SAL', 'ÇAR', 'PER', 'CUM', 'CMT', 'PAZ' ]
                .map((e) => Expanded(
                  child: Center(child: Text(e,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Poppins',fontSize: 14,height: 18/14,color: Colors.grey),)),
                )).toList(),

            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: calendarDays.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context,index){
                  final day= calendarDays[index];
                  if(day==null) return SizedBox.shrink();
            
                  bool isSelected = selectedDate?.year== day.year && selectedDate?.month== day.month && selectedDate?.day== day.day;
                  return GestureDetector( 
                    onTap: () {
                      setState(() {
                        if(isSelected){
                          selectedDate=null;
                        }
                        else{
                        selectedDate=day;
                        }
                        
                        
                      });
                      
                      
                    },
                    child: buildCalendarDay( day.day,isSelected),
                  );
            
                },
              ),
            ),
            SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: selectedDate != null
                        ? () {
                            Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => DobYearScreen(),
                        transitionsBuilder:(context,animation,secondaryAnimation,child){
                          return FadeTransition(opacity: animation,child: child,);
                        // ignore: prefer_const_constructors
                        },transitionDuration: Duration(milliseconds: 300),
                      ),);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedDate != null ? Color(0xFFEC617A) : Colors.grey.shade400,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
                      side: BorderSide(width: 1 ,color: Colors.white), 
                    ),
                    child: Text(
                      "Kaydet",
                      style: TextStyle(
                        color: selectedDate != null ? Colors.white : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

           





          ],
        ), 
                  
                
               
                
                
          
      ),
    );
  }


  Widget buildCalendarDay( int day, bool isSelected){
    return Column( 
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$day',
          style:TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,fontFamily: 'Poppins',height: 20/16),
        ),
        const SizedBox(height: 4),
        Container( 
          width: 24,
          height: 24,
          decoration: BoxDecoration(  
            color: isSelected? Color(0xFFEC617A) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Color(0xFFEC617A) : Colors.black26,
            ),

          ),
          child: isSelected ?Icon(Icons.check,color:Colors.white, size: 16,):null,
        ),
      ],
    );
  }
  List<DateTime?>_generateCalendarDays(DateTime month ){
    final firstDay = DateTime( month.year , month.month, 1);
    final totalDays = DateTime (month.year, month.month +1,0).day;
    final weekdayOffset= (firstDay.weekday+6 )%7;
    List<DateTime?> days= List.filled(weekdayOffset,null,growable:true);
    for(int i=1;i<=totalDays;i++){
      days.add(DateTime(month.year,month.month,i));
    }
    return days;

  }














}