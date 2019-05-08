import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWidget extends StatefulWidget{
  @override
  State createState() => WebViewWidgetState();
}

class WebViewWidgetState extends State<WebViewWidget> {

  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "https://www.google.cn",
          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
        ),
      },
    );
  }

}
