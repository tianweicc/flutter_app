import 'package:flutter/material.dart';
import 'pages/mine_screen.dart';
import 'pages/find_screen.dart';
import 'pages/home_screen.dart';
import 'pages/pages_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  List<Widget> list = List();
  var appBarTitles = ['首页', '发现', '生活', '我的'];
  var tabImages = [];

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }
  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }


  @override
  void initState() {
    tabImages = [
      [getTabImage('images/group5.png'), getTabImage('images/group55.png')],
      [getTabImage('images/group4.png'), getTabImage('images/group44.png')],
      [getTabImage('images/group111.png'), getTabImage('images/group11.png')],
      [getTabImage('images/group33.png'), getTabImage('images/group3.png')]
    ];

    list
      ..add(HomeScreen())
      ..add(FindScreen())
      ..add(PagesScreen())
      ..add(MineScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: getTabIcon(0),
              title: getTabTitle(0)),
          BottomNavigationBarItem(
              icon: getTabIcon(1),
              title:  getTabTitle(1)),
          BottomNavigationBarItem(
              icon: getTabIcon(2),
              title:  getTabTitle(2)),
          BottomNavigationBarItem(
              icon: getTabIcon(3),
              title:  getTabTitle(3)),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 按钮被点击后的动画效果
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
