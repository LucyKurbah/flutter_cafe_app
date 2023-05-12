import 'package:cafe_app/screens/orders/my_orders.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/cart/cartscreen.dart';
import '../screens/home/home.dart';
import '../screens/profile/profile.dart';
import 'colors.dart';
import 'dimensions.dart';

class CurvedNavigation extends StatefulWidget {
  @override
  _CurvedNavigationState createState() =>
      _CurvedNavigationState();
}

class _CurvedNavigationState extends State<CurvedNavigation> {
  int currentIndex = 0; 
  final screens = [
    Home(),
    Profile(),
    MyOrders(),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: mainColor, 
      color: Color.fromARGB(255, 40, 38, 38),
      // height: Dimensions.height60,
      animationDuration: Duration(milliseconds: 200),
      onTap: (index) {
        setState(() {
          currentIndex = index; // Update the currentIndex when an item is tapped
        });
        Get.to(() => screens[currentIndex], transition: Transition.rightToLeftWithFade);
        // if (index == 0) {
        //   Get.to(() => Home(), transition: Transition.rightToLeftWithFade);
        // } else if (index == 1) {
        //   Get.to(() => Profile(), transition: Transition.rightToLeftWithFade);
        // } else {
        //   Get.to(() => MyOrders(), transition: Transition.rightToLeftWithFade);
        // }
      },
      index: currentIndex, // Pass the currentIndex to highlight the selected item
      items: [
            Icon(Icons.home, color: textColor,size: Dimensions.iconSize30,),                                                 
            Icon(Icons.account_circle, color: textColor,size: Dimensions.iconSize30),     
            Icon(Icons.assignment_outlined, color: textColor,size: Dimensions.iconSize30),                                  
        ],
    );
  }
}