import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/web_view_page.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl, textUrl;

  CircleImage(this.imageUrl, this.textUrl);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepPurpleAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewPage(textUrl)));
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  width: 75.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(imageUrl)))),
            ),
          ],
        ));
  }
}
