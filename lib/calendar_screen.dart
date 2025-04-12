import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'year_screen.dart';




class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime? selectedDate;
  DateTime focusedMonth = DateTime.now();
  bool hasTappedOnce = false;
  bool isAnladimClicked= false;

  @override
  Widget build(BuildContext context) {
    final List<DateTime?> calendarDays = _generateCalendarDays(focusedMonth);

    return Scaffold(
      backgroundColor: Colors.white,
    
      body: Padding(
        padding: const EdgeInsets.all(16),
        
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
          SizedBox(height: 16,),
            // Month Navigation
            Row(
             
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    print("Testing branch commit");
                    setState(() {
                      focusedMonth = DateTime(focusedMonth.year, focusedMonth.month - 1);
                    });
                  },
                ),
                
                
                  
                  Expanded(
                    child: Text(
                      DateFormat.yMMMM('tr_TR').format(focusedMonth),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Poppins',height: 20/16),
                    ),
                  ),
                
                // Show next only if not current month
                
                focusedMonth.year < DateTime.now().year ||
                        (focusedMonth.year == DateTime.now().year &&
                            focusedMonth.month < DateTime.now().month)
                    ? IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          setState(() {
                            focusedMonth = DateTime(focusedMonth.year, focusedMonth.month + 1);
                          });
                        },
                      )
                    : SizedBox(width:30),
              ],
            ),
            SizedBox(height: 10),

            // Weekdays
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['PZT', 'SAL', 'ÇAR', 'PER', 'CUM', 'CMT', 'PAZ']
                  .map((e) => Expanded(
                        child: Center(
                            child: Text(
                          e,
                          style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Poppins,',fontSize: 14,height: 18/14,color: Colors.grey),
                        )),
                      ))
                  .toList(),
            ),
            SizedBox(height:1),

            // Calendar Grid
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: calendarDays.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                ),

                itemBuilder: (context, index) {
                  final day = calendarDays[index];

                  if (day == null) return SizedBox.shrink();

                  bool isSelected = selectedDate?.year == day.year &&
                      selectedDate?.month == day.month &&
                      selectedDate?.day == day.day;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDate = null;
                        } else {
                          selectedDate = day;
                        }
                        hasTappedOnce = true;
                      });
                    },
                    child: buildCalendarDay(day.day, isSelected),
                  );
                },
              ),
            ),
            SizedBox(height:1),

            // Action Buttons
            Column(
              children: [
                // Kaydet
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: selectedDate != null
                        ? () {
                            Navigator.push(context,
                      PageRouteBuilder(
                        pageBuilder: ( context,animation,secondaryAnimation) => YearScreen(),
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
                SizedBox(height: 10),
                // Hatırlamıyorum
                if (!hasTappedOnce)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.white,shape: RoundedRectangleBorder(   
                borderRadius: BorderRadius.vertical(top:Radius.circular(16)),
              ),
              builder: (context) => buildBottomSheet()
              );
                        print("Hatırlamıyorum clicked");
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFEC617A)),
                        foregroundColor: Color(0xFFEC617A),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),)
                      ),
                      child: Text(
                        "Hatırlamıyorum",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(){
    return Container(
      height:210,
      width: double.infinity, // Example height
      padding: EdgeInsets.fromLTRB(16,24,16,24),
      decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),) ,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 343,
            
            alignment: Alignment.centerRight,
            child: IconButton(icon:Icon(Icons.close),
          
            onPressed:(){
              Navigator.pop(context);
            },
            ),
          ),
          Container(  
            height: 60,
            width: 343,
            alignment: Alignment.center,
            child: Text("Eğer adet tarihinizden emin değilseniz yaklaşık bir seçim yapabilirsiniz; ilerleyen süreçte kolayca güncelleme yapabileceksiniz.",
            style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 14,height: 20/14, ),
            textAlign: TextAlign.center,),

          ),
          SizedBox( height: 10,),
          SizedBox(  
            width: 343,
            height: 40,
            child: OutlinedButton(  
              onPressed: (){
                setState(() {
                  isAnladimClicked=true;
                });
                Navigator.pop(context);
                
                Navigator.push(context, PageRouteBuilder(transitionDuration: Duration(microseconds: 300),
                transitionsBuilder: (context,animation,secondaryAnimation,child){
                  return FadeTransition(opacity: animation, child: child,);
                },
                pageBuilder: (context,animation,secondaryAnimation)=>CalendarScreen(), 
                ),);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side:BorderSide(color: Colors.pink ,width: 1),
                shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text("Anladım",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500,color:Colors.pink),),
            ),
          ),
        

          
        ],
      ),
    );
  
  } 
  

  Widget buildCalendarDay(int day, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$day',
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

  List<DateTime?> _generateCalendarDays(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final totalDays = DateTime(month.year, month.month + 1, 0).day;
    final weekdayOffset = (firstDay.weekday + 6) % 7;

    List<DateTime?> days = List.filled(weekdayOffset, null, growable: true);
    for (int i = 1; i <= totalDays; i++) {
      days.add(DateTime(month.year, month.month, i));
    }
    return days;
  }
}
