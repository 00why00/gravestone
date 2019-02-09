import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var leftRightPadding = 30.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0,color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0,color: Colors.black26);
  static const LOGO = "images/grave.png";

  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodeUserPass = new FocusNode();
  var _userNameController = new TextEditingController();
  var _userPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录",style: new TextStyle(color: Colors.white),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              print('Clicked Leading');
              //TODO:close app
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: (){
              print('Clicked Star');
              //TODO:follow a grave action
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              print('Clicked share');
              //TODO:follow a grave action
            },
          ),
          Container(
            child: new Card(
              color: Colors.green,
              elevation: 6.0,
              child: new FlatButton(
                  onPressed: (){
                    print('clicked register');
                    //TODO:跳转到注册页面
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text(
                      '注册',
                      style: new TextStyle(color: Colors.white,fontSize: 16.0),
                    ),
                  )
              ),
            ),
          )
        ],
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.fromLTRB(
                  leftRightPadding,10.0,leftRightPadding,10.0),
              child: new Image.asset(LOGO),
          ),

          new Padding(
              padding: new EdgeInsets.fromLTRB(
                  leftRightPadding,10.0,leftRightPadding,topBottomPadding),
              child: new TextField(
                  style: hintTips,
                  controller: _userNameController,
                  decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.person),
                      hintText: "请输入用户名",
                      labelText: "用户名",
                  ),
                  obscureText: false,
                  focusNode: _focusNodeUserName,
                  onSubmitted: (String userName){
                    //TODO:Save userName to SQL
                  },
              ),
          ),

          new Padding(
              padding: new EdgeInsets.fromLTRB(
                  leftRightPadding, 10.0, leftRightPadding, topBottomPadding),
              child: new TextField(
                  style: hintTips,
                  controller: _userPassController,
                  decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.vpn_key),
                      hintText: "请输入密码",
                      labelText: "密码",
                  ),
                  obscureText: true,
                  focusNode: _focusNodeUserPass,
                  onSubmitted: (String userPass){
                    //TODO:Save userPass to SQL
                  },
                ),

          ),

          new Container(
            width: 360.0,
            margin: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, topBottomPadding, leftRightPadding, topBottomPadding),
            child: new Card(
              color: Colors.green,
              elevation: 6.0,
              child: new FlatButton(
                  onPressed: (){
                    print("the pass is"+_userPassController.text);
                    //TODO:验证和登录
                  },
                  child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                          '立即登录',
                          style: new TextStyle(color: Colors.white,fontSize: 16.0),
                      ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
