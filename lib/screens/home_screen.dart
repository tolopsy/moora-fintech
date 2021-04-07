import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moora_ui/constants/color_constants.dart';
import 'package:moora_ui/models/card_models.dart';
import 'package:moora_ui/models/operation_models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  List<T> operationsMap<T>(List operationList, Function handler) {
    List<T> operations = [];
    for (var i = 0; i < operationList.length; i++) {
      operations.add(handler(i, operationList[i]));
    }

    return operations;
  }

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
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor),
                    ),
                    Text("Lanre Tolu",
                        style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor))
                  ],
                )),

            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 350,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Color(cards[index].cardBackground)),
                    child: Stack(
                      children: [
                        Positioned(
                          child: SvgPicture.asset(cards[index].cardElementTop),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child:
                              SvgPicture.asset(cards[index].cardElementBottom),
                        ),
                        Positioned(
                          top: 45,
                          left: 30,
                          child: Text(
                            "CARD NUMBER",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor),
                          ),
                        ),
                        Positioned(
                          top: 62,
                          left: 30,
                          child: Text(
                            cards[index].cardNumber,
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: kWhiteColor),
                          ),
                        ),
                        Positioned(
                          right: 30,
                          top: 32,
                          child: Image.asset(cards[index].cardType,
                              width: 30, height: 30),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 45,
                          child: Text(
                            "HOLDER'S NAME",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 22,
                          child: Text(
                            cards[index].user,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 208,
                          bottom: 45,
                          child: Text(
                            "EXPIRY DATE",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 208,
                          bottom: 22,
                          child: Text(
                            cards[index].cardExpired,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            // Operations section
            Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 26,
                  bottom: 10,
                  right: 9
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Operation",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children:
                          operationsMap(operations, (index, activeOperation) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentSlider == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
