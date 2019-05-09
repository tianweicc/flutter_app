import 'package:flutter/material.dart';
import 'package:flutter_app/components/slider_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/components/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() => TextFieldFocusDemoState();
}

class TextFieldFocusDemoState extends State<MyApp> {
  final String mUserName = "userName";
  String mfirst = "";

  Future<String> getuserName() async {
    var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(mUserName);
    return userName;
  }

  @override
  void initState() {
    Future<String> userName = getuserName();
    userName.then((String userName){
      setState(() {
        mfirst = userName;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("$mfirst");
    if("$mfirst" == 'null') {
      return new MaterialApp(
        home: new SliderWidget(),
        theme: new ThemeData(
          primaryColor: Colors.blue,
          platform: TargetPlatform.iOS,
        ),
      );
    } else {
      return new MaterialApp(
        home: new SplashScreen(),
        theme: new ThemeData(
          primaryColor: Colors.blue,
          platform: TargetPlatform.iOS,
        ),
      );
    }

  }
}

