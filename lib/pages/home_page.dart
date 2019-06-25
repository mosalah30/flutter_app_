import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/card_item.dart';
import 'package:flutter_app_demo/pages/web_view_page.dart';
import 'package:flutter_app_demo/ui/card_widget.dart';
import 'package:flutter_app_demo/ui/rectangle_image.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cards> list = List();
  List<RectangleImage> listImage = List();
  var isLoading = false;

  _fetchData() async {
    setState(() => isLoading = true);
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=6ba7df004b6846989b72984297bd7e70");
    if (response.statusCode == 200) {
      var jsons = json.decode(response.body);
      final articles = jsons['articles'];
      for (var i in articles) {
        list.add(Cards(
            title: i['title'].toString(),
            image: i['urlToImage'].toString(),
            description: i['description'].toString(),
            url: i['url'].toString()));
      }
      setState(() => isLoading = false);
    } else {
      throw Exception('Failed to load photos');
    }
  }

  _fetchDataImage() async {
    setState(() => isLoading = true);

    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=6ba7df004b6846989b72984297bd7e70");
    if (response.statusCode == 200) {
      var jsons = json.decode(response.body);
      final articles = jsons['articles'];
      for (var i in articles) {
        listImage
            .add(RectangleImage(i['urlToImage'].toString(), i['url'].toString()));
      }
      setState(() => isLoading = false);
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('HOME'),
          centerTitle: true,
        ),
        body: Material(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[

            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: listImage.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return RectangleImage(listImage[index].imageUrl,
                              listImage[index].textUrl);
                        }),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartWidget(
                          title: list[index].title,
                          description: list[index].description,
                          image: list[index].image,
                          url: list[index].url,
                        );
                      }),
                ],
              ),
            )
          ])
        ));
  }

  @override
  void initState() {
    super.initState();
    _fetchDataImage();
    _fetchData();
  }
}
