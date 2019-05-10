import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  @override
  TabWidgetState createState() => TabWidgetState();
}

class TabWidgetState extends State<TabWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        physics: new BouncingScrollPhysics(),
        // 需要使用 slivers 才可以
        slivers: <Widget>[
          // 头部内容
          new SliverAppBar(
            // 高度
            expandedHeight: 256.0,
            pinned: true,
            floating: !true,
            snap: !true,
            flexibleSpace: new FlexibleSpaceBar(
              // 标题
              title: Text('标题'),
              centerTitle: true,
              // 背景图
              background: new Image.network(
                'http://img.anfone.net/Outside/anfone/201666/2016661523021277.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 列表内容
          new SliverList(
            delegate: new SliverChildBuilderDelegate((ctx, index) {
              return new Container(
                decoration: new BoxDecoration(color: Colors.white),
                child:  Text('item: $index'),
              );
            }, childCount: 90),
          ),
        ],
      ),
    );
  }
}

