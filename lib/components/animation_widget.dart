import 'package:flutter/material.dart';

class AnimaTionWidget extends StatefulWidget {
  @override
  State createState() => AnimaTionWidgetState();
}

class AnimaTionWidgetState extends State<AnimaTionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation parentAnimation;
  Animation childAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    parentAnimation = Tween(begin: -0.5, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    childAnimation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: parentAnimation,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('简单动画'),
          ),
          body: Transform(
            transform: Matrix4.translationValues(
                parentAnimation.value * width, 0.0, 0.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: childAnimation,
                    builder: (BuildContext context, Widget child) {
                      return Container(
                        color: Colors.lightBlue,
                        width: childAnimation.value * 2,
                        height: childAnimation.value,
                        child: Text(
                          '大老虎',
                          style:
                              new TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      );
                    },
                  ),
                  Container(
                    color: Colors.orange,
                    width: 200.0,
                    height: 100.0,
                    child: Text(
                      '小🐀',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
