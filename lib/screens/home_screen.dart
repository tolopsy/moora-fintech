import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            // AppBar holds the menu icon and user avatar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Menu tapped");
                    },
                    child: SvgPicture.asset("assets/images/menu_icon.svg"),
                  ),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/user_avatar.png"))),
                  )
                ],
              ),
            ),

            // Hero section with welcome message and virtual card displayed
            
          ],
        ),
      ),
    );
  }
}
