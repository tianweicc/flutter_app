import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

class RigisterWidget extends StatefulWidget {
  @override
  State createState() => TextFieldFocusDemoState();
}

class TextFieldFocusDemoState extends State<RigisterWidget> {
  TextEditingController _nameController, _pwController;
  FocusNode _pwFocus;

  final String mUserName = "userName";
  final String mPassWord = "passWord";

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(mUserName, _nameController.value.text.toString());
    prefs.setString(mPassWord, _pwController.value.text.toString());
    Timer timer = new Timer(new Duration(seconds: 1), () {
      // 只在倒计时结束时回调
      Fluttertoast.showToast(
          msg: "注册成功，并返回首页",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
      );
      Navigator.pop(context);
    });

  }

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
//    _nameFocus = FocusNode();
    _pwFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
//                  focusNode: _nameFocus,
                  controller: _nameController,
                  keyboardType: TextInputType.number,
                  //限制键盘是数字
//                  maxLength: 11, // 限制长度
                  maxLines: 1,
                  //限制一行
//                  obscureText: false,
//                  textInputAction: TextInputAction.next,
                  onSubmitted: (input) {
//                    _nameFocus.unfocus();
//                    FocusScope.of(context).requestFocus(_pwFocus);
                  },
                  decoration: InputDecoration(
                    labelText: "name",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  focusNode: _pwFocus,
                  controller: _pwController,
//                  obscureText: true, // 是否是密码
//                  textInputAction: TextInputAction.done,
                  onSubmitted: (input) {
//                    _pwFocus.unfocus();
                  },
                  decoration: InputDecoration(
                    labelText: '请输入密码',
//              helperText: '注册时输入的姓名',
//              helperStyle: new TextStyle(color: Colors.blue)
                  ),
                ),
              ),
            ),
//            const SizedBox(height: 40.0),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    save();
                  },
                  child: Text('注册'),
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
