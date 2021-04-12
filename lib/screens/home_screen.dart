import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moora_ui/constants/color_constants.dart';
import 'package:moora_ui/models/card_models.dart';
import 'package:moora_ui/models/operation_models.dart';
import 'package:moora_ui/models/transaction_models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentOperation = 0;

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
          children: <Widget>[
            // AppBar holds the menu icon and user avatar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                  children: <Widget>[
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
                      children: <Widget>[
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
                padding:
                    EdgeInsets.only(left: 16, top: 26, bottom: 10, right: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Operation",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: operationsMap<Widget>(operations,
                          (index, activeOperation) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentOperation == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                )),

            Container(
              height: 120,
              child: ListView.builder(
                itemCount: operations.length,
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentOperation = index;
                      });
                    },
                    child: OperationCard(
                        operations[index].name,
                        operations[index].selectedIcon,
                        operations[index].unselectedIcon,
                        currentOperation == index,
                        this),
                  );
                },
              ),
            ),

            // Transaction History
            Padding(
              padding:
                  EdgeInsets.only(left: 16, top: 26, bottom: 10, right: 10),
              child: Text(
                "Transaction History",
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListView.builder(
              itemCount: transactions.length,
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                  height: 60,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: kTenBlackColor,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(7, 7))
                      ]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  final _HomeScreenState context;

  OperationCard(this.operation, this.selectedIcon, this.unselectedIcon,
      this.isSelected, this.context);

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16),
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kTenBlackColor,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(8.0, 8.0))
          ],
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected ? kBlueColor : kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(widget.isSelected
                ? widget.selectedIcon
                : widget.unselectedIcon),
            SizedBox(
              height: 10,
            ),
            Text(widget.operation,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: widget.isSelected ? kWhiteColor : kBlueColor))
          ],
        ));
  }
}
