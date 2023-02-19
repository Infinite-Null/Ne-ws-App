import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news/Category_Each.dart';
import 'package:news/Models/category.dart';

class Category extends StatefulWidget {
  const Category({Key key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  initState() {
    found_cat = cat;
    super.initState();
  }

  List<category> cat = [
    category("National", "./assets/national.jpg"),
    category("Business", "./assets/business.jpg"),
    category("Sports", "./assets/sports.jpg"),
    category("World", "./assets/wrold.jpg"),
    category("Politics", "./assets/politics.jpg"),
    category("Technology", "./assets/technology.jpg"),
    category("Startup", "./assets/startup.jpg"),
    category("Entertainment", "./assets/entertain.png"),
    category("Miscellaneous", "./assets/mis.PNG"),
    category("Hatke", "./assets/hatke.jpg"),
    category("Science", "./assets/science.jpg"),
    category("Automobile", "./assets/car.jpg"),
  ];
  List<category> found_cat = [];

  void runFilter(String enteredKeyword) {
    List<category> results = [];
    if (enteredKeyword.isEmpty) {
      results = cat;
    } else {
      results = cat
          .where((user) =>
              user.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      found_cat = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: width / 1.35,
                child: TextField(
                  onChanged: (value) {
                    runFilter(value.toString());
                  },
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.blue,
                  cursorRadius: Radius.circular(100),
                  cursorWidth: 4,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(117, 255, 255, 255)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(13),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(25, 30, 25, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Color.fromARGB(23, 255, 255, 255), width: 3),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(33, 147, 147, 147),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
                BoxShadow(
                  color: Color.fromARGB(15, 255, 255, 255),
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 15.0,
                  spreadRadius: 5.0,
                )
              ]),
          height: (height >= 790) ? height / 1.45 : height / 1.515,
          width: width,
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: found_cat.length,
              itemBuilder: (context, index) {
                return Category_One(height, width, found_cat[index].title, 0,
                    found_cat[index].url);
              }),
        )
      ],
    );
  }
}
