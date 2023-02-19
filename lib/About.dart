import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  List<Color> color = [
    Color.fromRGBO(255, 236, 172, 1),
    Color.fromRGBO(255, 215, 208, 1),
    Color.fromRGBO(198, 228, 255, 1),
    Color.fromRGBO(210, 196, 255, 1),
  ];

  Random rand = Random();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: color[rand.nextInt(4)],
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 1.2)),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("./assets/logo.png"))),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  width: width / 1.25,
                  child: Text(
                    "Do you wanna stay current with the news while getting home, or in your free time? \n News app keeps you updated with happenings around you.News app provide's you with Tons of latest news from all categories.",
                    style: GoogleFonts.sono(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1.2)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Developed by",
                            style:
                                GoogleFonts.saira(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Ankit Kumar Shah",
                            style:
                                GoogleFonts.sono(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(6),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("./assets/me.jpg"))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Github",
                            style:
                                GoogleFonts.saira(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Infinite-Null",
                            style:
                                GoogleFonts.sono(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(6),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("./assets/github.jpg"))),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
