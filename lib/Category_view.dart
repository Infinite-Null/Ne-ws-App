import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Models/news.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'NewsCard.dart';

class Category_view extends StatelessWidget {
  String value;
  Category_view(this.value);
  List<News> data = [];
  Future<List<News>> getData() async {
    String search = value.toLowerCase();
    data.clear();
    print("Data");
    final response = await http
        .get(Uri.parse("https://inshorts.deta.dev/news?category=${search}"));
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        title: Text(
          value + " Ne-ws",
          style: GoogleFonts.sono(textStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height / 1.4,
                        width: width,
                        child: Swiper(
                          onIndexChanged: (value) {
                            color_i++;
                          },
                          physics: BouncingScrollPhysics(),
                          layout: SwiperLayout.TINDER,
                          itemWidth: width,
                          itemHeight: height / 1.4,
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
                      ),
                    ],
                  );
                }
              })
        ],
      ),
    );
  }
}
