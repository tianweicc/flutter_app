import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HeaderWidget extends StatefulWidget {
  @override
  HeaderWidgetState createState() => HeaderWidgetState();
}

class HeaderWidgetState extends State<HeaderWidget> {
  List subjects = [];

  @override
  void initState() {
    loadData();
  }

  loadData() async {
    String loadRUL = "https://api.douban.com/v2/movie/in_theaters";
    Dio dio = new Dio();
    Response response = await dio.get(loadRUL);
    print(response.data);
    setState(() {
      subjects = response.data['subjects'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        physics: new AlwaysScrollableScrollPhysics(),
        // 需要使用 slivers 才可以
        slivers: <Widget>[
          // 头部内容
          new SliverAppBar(
            // 高度
            expandedHeight: 200.0,
            pinned: true,
            floating: !true,
            snap: !true,
            flexibleSpace: new FlexibleSpaceBar(
              // 标题
              title: Text(
                '动态头部',
                style: TextStyle(fontSize: 20),
              ),
              centerTitle: true,
              // 背景图
              background: new Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557377088723&di=844ad0ce06f402d7150c34f5d8fdd717&imgtype=0&src=http%3A%2F%2Fwk.impress.sinaimg.cn%2Fmaxwidth.600%2Fsto.kan.weibo.com%2F02c30cdc3502fea48fb8c2508575b6b1.png%3Fwidth%3D600%26height%3D338',
                fit: BoxFit.cover,
              ),
            ),
          ),
          getbody()
        ],
      ),
    );
  }

  getbody() {
    if (subjects.length != 0) {
      return new SliverList(
        delegate: new SliverChildBuilderDelegate((context, index) {
          return Container(
              decoration: new BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: new Image.network(subjects[index]['images']['large'],
                        width: 100.0, height: 150.0),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8.0),
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            subjects[index]['title'],
                            style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),
                          ),
                          Text(
                            '豆瓣评分：${subjects[index]['rating']['average']}',
                            style: TextStyle(fontSize: 16.0, decoration: TextDecoration.none),
                          ),
                          Text(
                            subjects[index]['genres'].join("、"),
                            style:
                                TextStyle(fontSize: 16, color: Colors.black38, decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        }, childCount: subjects.length),
      );
    } else {
      return new SliverList(delegate: new SliverChildBuilderDelegate((context, index) {
        return Align(
          alignment: Alignment.center,
          widthFactor: 10.0,
          heightFactor: 18.0,
          child: Text('加载中...', style: TextStyle(color: Colors.deepOrange, decoration: TextDecoration.none, fontSize: 20),),
        );
      }, childCount: 1));
    }
  }
}
