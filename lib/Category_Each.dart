import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Category_view.dart';

class Category_One extends StatelessWidget {
  double width;
  double height;
  String category;
  int i;
  String image;
  Category_One(this.height, this.width, this.category, this.i, this.image);
  List<Color> colors = [
    Color.fromARGB(255, 227, 193, 116),
    Color.fromARGB(255, 93, 212, 119),
    Color.fromARGB(255, 0, 150, 135),
    Color.fromARGB(255, 255, 86, 34),
    Color.fromARGB(255, 131, 0, 212)
  ];
  @override
  Widget build(BuildContext context) {
    print(width);
    print(height);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => Category_view(category))));
      },
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(84, 0, 0, 0), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(image)),
                borderRadius: BorderRadius.circular(15),
              ),
              height: height / 7,
              width: (width >= 380) ? width / 2.59 : width / 2.87,
              child: Container(
                padding: EdgeInsets.all(12),
                child: FittedBox(
                  child: Text(
                    category,
                    style: GoogleFonts.sono(
                        textStyle: TextStyle(
                            backgroundColor: Color.fromARGB(121, 0, 0, 0),
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
