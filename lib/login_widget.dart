import 'package:flutter/material.dart';
import 'register_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_navigation_widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  State createState() => TextFieldFocusDemoState();
}

class TextFieldFocusDemoState extends State<LoginWidget> {

  final String mUserName = "userName";
  final String mPassWord = "passWord";
  final _userNameController = new TextEditingController();
  final _passWordController = new TextEditingController();

  Future<String> getuserName() async {
    var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(mUserName);
    return userName;
  }

  Future<String> getpassWord() async {
    var passWord;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    passWord = prefs.getString(mPassWord);
    return passWord;
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        margin: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Image.asset('./images/city.png'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
//                  focusNode: _nameFocus,
                  controller: _userNameController,
                  keyboardType: TextInputType.number, //限制键盘是数字
//                  maxLength: 11, // 限制长度
                  maxLines: 1,    //限制一行
//                  obscureText: false,
//                  textInputAction: TextInputAction.next,
                  onSubmitted: (input){
//                    _nameFocus.unfocus();
//                    FocusScope.of(context).requestFocus(_pwFocus);
                  },
                  decoration: InputDecoration(
                      hintText: '请输入账号/手机号',
                      hintStyle:TextStyle(color:Color( 0xff444444 ))
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 0.0, bottom: 20.0, right: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  controller: _passWordController,
//                  obscureText: true, // 是否是密码
//                  textInputAction: TextInputAction.done,
                  onSubmitted: (input){
                  },
                  decoration: InputDecoration(
                      hintText: '请输入密码',
                      hintStyle:TextStyle(color:Color( 0xff444444 ))
                  ),
                ),
              ),
            ),
            RaisedButton(
              shape: StadiumBorder(),
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Text('登录', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Future<String> userName = getuserName();
                Future<String> passWord = getpassWord();
                userName.then((String userName) {
                  passWord.then((String passWord){
                    if (_userNameController.value.text.toString() == userName && _passWordController.value.text.toString() == passWord) {
                      // 跳转过去 不带返回键
                      Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                              new BottomNavigationWidget()));
                    } else {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('账号错误'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('关闭'),
                                onPressed: () => Navigator.pop(context, false),
                              ),
                            ],
                          ));
                    }
                  });
                });
              },
            ),
            RaisedButton(
              shape: StadiumBorder(),
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Text('注册'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new RigisterWidget()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
