import 'package:flutter/material.dart';
import 'package:flutter_app/components/video_widget.dart';
import 'package:flutter_app/components/webview_widget.dart';

class PagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生活'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => VideoWidget()));
            },
            child: Text('视频播放'),
            color: Colors.white,
          ),
          Tooltip(
            message: '我是tootip实例~~',
            child: Text('我是tootip',
                style: new TextStyle(color: Colors.deepOrange, fontSize: 18)),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => WebViewWidget()));
            },
            child: Text('webView'),
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
