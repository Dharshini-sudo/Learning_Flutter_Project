import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  
  final List<Map<String, String>> items = [
    {
      "title": "Doğum sonrası dönemi",
      "image": "assets/images/image_6.png",
    },
    {
      "title": "Doğum çantası hazırlaması",
      "image":  "assets/images/image_1.png",
    },
    {
      "title": "Alışveriş yapmak",
      "image":  "assets/images/image_2.png",
    },
    {
      "title": "Bebek bakımı",
      "image":  "assets/images/image_3.png",
    },
    {
      "title": "Bilgi almak",
      "image":  "assets/images/image_4.png",
    },  
    {
      "title": "Uzmana soru sormak",
      "image":  "assets/images/image_5.png",
    },
  ];

  Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              SizedBox(height: 16,),

              Container(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  "Size nasıl yardımcı olabiliriz?",
                  style: TextStyle(
                    fontFamily: 'Renogare',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height: 24/20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text(
                " Sevdiğiniz ve ihtiyaç duyduğunuz içerikleri seçin.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 18/14,
                ),
                
              ),
              SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 164 / 129,
                ),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndexes.contains(index);
                  final item =items[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndexes.remove(index);
                        } else {
                          selectedIndexes.add(index);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? Colors.pinkAccent : Colors.grey.shade300,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 16,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(  
                                item["image"]!,
                                height: 48,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 16,
                                width: 141,
                                child: Text(
                                  item["title"]!,
                                  
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 16/12,
                              
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected?  Colors.pinkAccent : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isSelected ? Colors.pinkAccent : Colors.grey.shade300,
                          width: 2,
                        ),
                                
                                
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Center(  
                                child: Icon(  
                                  Icons.check,
                                  size: 16,
                                  color: isSelected? Colors.white:Colors.transparent,
                                  
                                ),
                              ),
                            ),
                          ),







                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedIndexes.isNotEmpty ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedIndexes.isNotEmpty ? Colors.pinkAccent : Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Devam Et",
                    style: TextStyle(
                      fontFamily: 'Renogare',
                      fontSize: 16,
                      height: 20/16,
                      fontWeight: FontWeight.w400,
                      color: selectedIndexes.isNotEmpty ? Colors.white : Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
