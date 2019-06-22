import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/web_view_page.dart';

class CartWidget extends StatelessWidget {
  final String description, title, image, url;

  CartWidget({this.description, this.image, this.title, this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        color: Colors.lightBlue,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>
                  WebViewPage(url),
              ));
              },
            child: Card(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.network(
                    image,fit: BoxFit.fitWidth,height: 150,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontFamily: 'AbrilFatface'),
                  ),
                   Text(description)
                ],
              ),
            ),
          ),
        ));
  }
}
