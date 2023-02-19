import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  String title;
  int i;
  String cotent;
  String image_url;
  String time;
  String name;
  NewsCard(
      this.title, this.cotent, this.image_url, this.time, this.name, this.i);
  List<Color> color = [
    Color.fromRGBO(255, 239, 187, 1),
    Color.fromRGBO(255, 225, 220, 1),
    Color.fromRGBO(213, 234, 253, 1),
    Color.fromRGBO(220, 211, 251, 1),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GlassContainer.frostedGlass(
        padding: EdgeInsets.all(10),
        borderWidth: 0,
        borderRadius: BorderRadius.circular(15),
        blur: 2,
        elevation: 12,
        shadowColor: Colors.black,
        color: color[i],
        height: (height > 784)
            ? height / 1.25
            : (height > 695)
                ? height / 1.26
                : height / 1.7,
        width: width,
        child: Column(
          children: [
            !(height > 784)
                ? Container(
                    padding: EdgeInsets.all(15),
                    child: Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20)),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    child: Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 30)),
                      ),
                    ),
                  ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.person)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Published by",
                          style: TextStyle(fontWeight: FontWeight.w200),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Updated on " + time,
                  textAlign: TextAlign.left,
                )),
            Container(
              margin: EdgeInsets.all(12),
              height: (height > 784)
                  ? 150
                  : (height > 695)
                      ? 120
                      : 150,
              width: width / 1.2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image_url))),
            ),
            Expanded(
              child: Container(
                  height: 150,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          cotent,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: width / 18)),
                        ),
                      ],
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Text("Close"),
                                    Icon(Icons.close),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                      backgroundColor: color[i],
                      content: Image(image: NetworkImage(image_url)),
                    );
                  },
                );
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)),
                child: Text(
                  "View Image",
                  style: GoogleFonts.sono(color: Colors.black, fontSize: 12),
                ),
              ),
            )
          ],
        ));
  }
}
