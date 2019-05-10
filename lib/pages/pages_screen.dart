import 'package:flutter/material.dart';
import 'package:flutter_app/views/video_widget.dart';
import 'package:flutter_app/views/webview_widget.dart';
import 'package:flutter_app/views/animation_widget.dart';
import 'package:flutter_app/views/animationhearder_widget.dart';

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
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => WebViewWidget()));
            },
            child: Text('webView'),
            color: Colors.greenAccent,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => AnimaTionWidget()));
            },
            child: Text('简单动画'),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => HeaderWidget()));
            },
            child: Text('动画改变头部'),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          Expanded(
            child: GestureDetector(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Image.network(
                      "https://img14.360buyimg.com/n7/jfs/t12637/42/2327024214/114895/ec325f4f/5ab4b331Nbf564b11.jpg",
                      width: 100),
                  Image.network(
                      "https://img10.360buyimg.com/n7/jfs/t18397/29/988914537/96851/e92ecd25/5ab4c6aaNb4df6198.jpg",
                      width: 100),
                  Image.network(
                      "https://img13.360buyimg.com/n7/jfs/t18097/249/986540321/88281/625f677e/5ab4cb3bN0943eaf5.jpg",
                      width: 100),
                  Image.network(
                      "https://img14.360buyimg.com/n7/jfs/t12637/42/2327024214/114895/ec325f4f/5ab4b331Nbf564b11.jpg",
                      width: 100),
                  Image.network(
                      "https://img11.360buyimg.com/n7/jfs/t25342/205/1747435396/262760/8f54e2/5bbac0f7N012a9912.jpg",
                      width: 100),
                  Image.network(
                      "https://img11.360buyimg.com/n7/jfs/t25342/205/1747435396/262760/8f54e2/5bbac0f7N012a9912.jpg",
                      width: 100),
                ],
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('这是横向的listview'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('close'),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ],
                    ));
              },
            )
          )
        ],
      ),
    );
  }
}
