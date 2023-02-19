import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news/About.dart';
import 'package:news/Category.dart';
import 'package:news/NewsCard.dart';
import 'Models/news.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.black),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<News> data = [];
  int index_page = 0;
  Future<List<News>> getData() async {
    data.clear();
    print("Data");
    final response = await http
        .get(Uri.parse("https://inshorts.deta.dev/news?category=all"));
    print("Hi");
    var dat = jsonDecode(response.body.toString());
    print(dat);
    if (response.statusCode == 200) {
      for (Map i in dat["data"]) {
        data.add(News.fromJson(i));
      }
      return data;
    } else {
      return data;
    }
  }

  int color_i = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: (index_page == 2) ? true : false,
      extendBodyBehindAppBar: (index_page == 2) ? true : false,
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: GNav(
            onTabChange: (value) {
              setState(() {
                index_page = value;
              });
            },
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            padding: (height > 784)
                ? EdgeInsets.all(15)
                : (height > 695)
                    ? EdgeInsets.all(8)
                    : EdgeInsets.all(8),
            gap: 10,
            tabActiveBorder:
                Border.all(color: Color.fromARGB(0, 227, 194, 116)),
            tabBackgroundColor: (index_page == 0)
                ? Color.fromARGB(255, 227, 193, 116)
                : (index_page == 1)
                    ? Colors.deepPurple
                    : Colors.lime,
            tabBorder: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
            activeColor: Colors.black,
            color: (index_page != 2) ? Colors.white : Colors.black,
            tabs: [
              GButton(
                text: "Home",
                icon: Icons.newspaper_outlined,
                iconColor: (index_page != 2) ? Colors.white : Colors.black,
              ),
              GButton(
                text: "Categories",
                icon: Icons.category_outlined,
                iconColor: (index_page != 2) ? Colors.white : Colors.black,
              ),
              GButton(
                text: "About",
                icon: Icons.person_outline_outlined,
                iconColor: (index_page != 2) ? Colors.white : Colors.black,
              ),
            ]),
      ),
      appBar: (index_page != 2)
          ? AppBar(
              elevation: 0,
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              title: Text(
                "Ne-ws",
                style: GoogleFonts.sono(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
              ),
            )
          : AppBar(
              elevation: 0,
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              title: Text(
                "Ne-ws",
                style: GoogleFonts.sono(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500)),
              ),
            ),
      body: (index_page == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Container(
                              height: height / 2,
                              width: width,
                              alignment: Alignment.center,
                              child: LoadingAnimationWidget.discreteCircle(
                                  size: 30, color: Colors.white)),
                        );
                      } else {
                        return Expanded(
                          child: Swiper(
                            onIndexChanged: (value) {
                              color_i++;
                            },
                            physics: BouncingScrollPhysics(),
                            layout: SwiperLayout.TINDER,
                            itemWidth: width,
                            itemHeight: (height > 784)
                                ? height / 1.25
                                : (height > 695)
                                    ? height / 1.26
                                    : height / 1.7,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              if (color_i == 4) {
                                color_i = 0;
                              }
                              return NewsCard(
                                  data[index].title.toString(),
                                  data[index].content.toString(),
                                  data[index].imageUrl.toString(),
                                  data[index].time.toString(),
                                  data[index].author.toString(),
                                  color_i);
                            },
                          ),
                        );
                      }
                    })
              ],
            )
          : (index_page == 1)
              ? Category()
              : About(),
    );
  }
}
