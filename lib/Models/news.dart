class News {
  String author;
  String content;
  String date;
  String id;
  String imageUrl;
  String readMoreUrl;
  String time;
  String title;
  String url;

  News(
      {this.author,
      this.content,
      this.date,
      this.id,
      this.imageUrl,
      this.readMoreUrl,
      this.time,
      this.title,
      this.url});

  News.fromJson(Map<dynamic, dynamic> json) {
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["content"] is String) {
      content = json["content"];
    }
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["imageUrl"] is String) {
      imageUrl = json["imageUrl"];
    }
    if (json["readMoreUrl"] is String) {
      readMoreUrl = json["readMoreUrl"];
    }
    if (json["time"] is String) {
      time = json["time"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["author"] = author;
    _data["content"] = content;
    _data["date"] = date;
    _data["id"] = id;
    _data["imageUrl"] = imageUrl;
    _data["readMoreUrl"] = readMoreUrl;
    _data["time"] = time;
    _data["title"] = title;
    _data["url"] = url;
    return _data;
  }
}
