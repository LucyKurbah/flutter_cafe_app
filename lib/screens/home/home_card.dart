import 'package:cafe_app/components/colors.dart';
import 'package:cafe_app/components/dimensions.dart';
import 'package:cafe_app/screens/table/table_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../conference/conference_screen.dart';
import '../menu/menu.dart';

class HomeCard extends StatefulWidget {
  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  // List<String> images = [
  //   'food/one.jpg',
  //   'food/two.jpg',
  //   'food/three.jpg',
  //   'food/four.jpg',
  // ];

  List<String> description = [
    'Table',
    'Conference',
    'Coffee & Convo',
    'Entire Floor',
  ];

   List<String> price = [
    '220.0',
    '190.0',
    '250.0',
    '300.0',
  ];

  List<String> pages = [
    'table',
    'conference',
    'coffee',
    'floor',
  ];

  List<Widget> myWidgets  = [
    TablePage(),
    ConferenceScreen(),
    MenuPage(),
    ConferenceScreen(),
  ];

  List<Map<String,dynamic>> gridMap = [

    {
      "title": "Tables",
      "price" : "1",
      "images": "Assets/home/table_w.png"
    },
    {
      "title": "Conference",
      "price" : "1",
      "images": "Assets/home/conference_w.png"
    },
    {
      "title": "Coffee & Convo",
      "price" : "1",
      "images": "Assets/home/coffee_w.png"
    },
    {
      "title": "Entire Floor",
      "price" : "1",
      "images": "Assets/home/room_w.png"
    }
    
  ];

  @override
  Widget build(BuildContext context) {
    return 
    
    Expanded(
      
      child: Padding(
        
        padding: EdgeInsets.all(Dimensions.width5),
        child: GridView.builder(
          
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: Dimensions.crossAxisSpacing10,
              mainAxisSpacing: Dimensions.mainAxisSpacing10,
              mainAxisExtent: Dimensions.mainAxisExtentSize-10,
              ),
          itemCount: gridMap.length, 
          itemBuilder: ((context, index) {
                return InkWell(
                     onTap: (){                        
                        // Navigator.pushNamed(context, '/${pages[index]}');
                        Get.to(() => myWidgets[index], transition: Transition.rightToLeftWithFade, duration: Duration(milliseconds: 300));
                      },
                  child: Container(
                    margin: EdgeInsets.all(Dimensions.width15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: textColor.withOpacity(0.09),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius15), topRight: Radius.circular(Dimensions.radius15)),
                          child: Transform.scale(
                            scale: 0.34,
                            child: Image.asset(
                              "${gridMap.elementAt(index)['images']}",
                              height: MediaQuery.of(context).size.height*0.2,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        ),
                        Padding(padding: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${gridMap.elementAt(index)['title']}", 
                                      style: TextStyle(color: textColor,
                                        fontSize: Dimensions.font15,
                                        fontWeight: FontWeight.bold
                                        
                                        )),
                              SizedBox(height: Dimensions.height10,),
                              Icon(Icons.arrow_right_alt_sharp, color: textColor)
                            ],
                          ),
                        )
                      ],
                    ),
                              
                  ),
                );
          })
          ),
      ),
    ); 
  }
}