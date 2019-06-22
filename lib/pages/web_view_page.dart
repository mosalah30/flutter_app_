import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent,),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
