import 'package:flutter/material.dart';

class FindScreen extends StatefulWidget {
  @override
  FindScreenState createState() => FindScreenState();
}

class FindScreenState extends State<FindScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('发现')),
        body: GestureDetector(
          child: new GridView.count(
            //一行多少个
            crossAxisCount: 2,
            padding: const EdgeInsets.all(10.0),
            // 上下间隔
            mainAxisSpacing: 0.0,
            // 左右间隔
            crossAxisSpacing: 10.0,
            //宽高比 默认1
            childAspectRatio: 10 / 6,
            children: _buildGridTileList(30),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('这是GridView~~'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('close'),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ],
                    ));
          },
        ));
  }

  List<Container> _buildGridTileList(int count) {
    return new List.generate(
        count,
        (int index) => new Container(
              height: 120,
              width: 100,
              child: new Image.asset("images/city.png"),
            ));
  }
}
