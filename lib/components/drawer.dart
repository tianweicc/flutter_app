import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_widget.dart';

class DrawerWidget extends StatefulWidget {
  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {

  @override
  Widget build(BuildContext context) {
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('weitian'),
      accountEmail: new Text('weitian.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new NetworkImage(
            "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
        child: new Text("伟田",
            style: TextStyle(color: Colors.black)), //可以在图片上添加文字等等
      ),
    );

    return new Column(
      children: <Widget>[
        new Expanded(
          flex: 11,
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              userHeader,
              ListTile(
                title: Text('item1'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.school),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('item2'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.list),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        new Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 30.0,
              child: new RaisedButton(
                shape: StadiumBorder(),
                padding: EdgeInsets.only(left: 50, right: 50),
                color: Colors.blue,
                child: Text('退出登录'),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginWidget()));
                },
              ),
            ))
      ],
    );
  }

}