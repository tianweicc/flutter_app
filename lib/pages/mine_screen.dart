import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MineScreen extends StatefulWidget {
  @override
  State createState() => MineScreenState();
}

class MineScreenState extends State<MineScreen> {
  List subjects = [];

  @override
  void initState() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: Center(
        child: getBody(),
      ),
    );
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

  getItem(var subjects) {
    // 演员列表
    var avatars = List.generate(subjects['casts'].length, (int index) =>
        Container(
          margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white10,
            backgroundImage: NetworkImage(
                subjects['casts'][index]['avatars']['small']
            ),
          ),
        ),
    );

    var row = GestureDetector(
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                subjects['images']['large'],
                width: 100.0, height: 150.0,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8.0),
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//                    电影名称
                      Text(
                        subjects['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        maxLines: 1,
                      ),
//                    豆瓣评分
                      Text(
                        '豆瓣评分：${subjects['rating']['average']}',
                        style: TextStyle(
                            fontSize: 16.0
                        ),
                      ),
//                    类型
                      Text(
                          "类型：${subjects['genres'].join("、")}"
                      ),
//                    导演
                      Text(
                          '导演：${subjects['directors'][0]['name']}'
                      ),
//                    演员
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text('主演：'),
                            Row(
                              children: avatars,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
      onTap: () {
        onItemClick( subjects['title'], subjects['casts'] ); //处理点击事件
      },
    );
    return Card(
      child: row,
    );
  }

  getBody() {
    if (subjects.length != 0) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (BuildContext context, int position) {
              return getItem(subjects[position]);
            }),
      );
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }

  /**
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      loadData();
    });
  }

  void onItemClick(String s, List bc) {
    print(bc);
    print(s);
     showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(s),
          actions: <Widget>[
            FlatButton(
              child: Text('关闭'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ));
  }
}

