import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {

  List<String> titles = [
    '我的消息',
    '阅读记录',
    '我的墓碑',
    '我的问答',
    '我的活动',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
    '我的xx',
  ];
  var userAvatar = null;
  var userName = null;
  //TODO:判断是否登录并从数据库获取用户头像和用户名

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        reverse: false,
        shrinkWrap: false,
        slivers: <Widget>[
          new SliverAppBar(
            pinned: false,
            backgroundColor: Colors.green,
            expandedHeight: 200.0,
            iconTheme: new IconThemeData(color: Colors.transparent),
            flexibleSpace: new InkWell(
              onTap: (){
                userAvatar == null ? debugPrint('登录') : debugPrint('用户信息');
                //TODO:判断是否登录
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  userAvatar == null
                      ? new Image.asset(
                    'images/avatar_default.png',
                    width: 60.0,
                    height: 60.0,
                  )
                      : new Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: new DecorationImage(
                          image: new NetworkImage(userAvatar),
                          //TODO:从数据库获取用户头像
                          fit: BoxFit.cover,
                      ),
                      border: new Border.all(
                        color: Colors.white,
                        width: 2.0,
                      )
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: new Text(
                      userName == null ? '点击修改头像' : userName,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          new SliverFixedExtentList(
              delegate:
                new SliverChildBuilderDelegate((BuildContext context,int index){
                  String title = titles[index];
                  return new Container(
                    alignment: Alignment.centerLeft,
                    child: new InkWell(
                      onTap: (){
                        print('this is the item of $title');
                        //TODO:各个组件对应的点击事件
                      },
                      child: new Column(
                        children: <Widget>[
                          new Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                      child: new Text(
                                        title,
                                        style: TextStyle(),//TODO:设置文字样式
                                      )
                                  ),
                                  new Icon(
                                    Icons.chevron_right,
                                  ),
                                ],
                              ),
                          ),
                          new Divider(
                            height: 6.0,
                          )
                        ],
                      ),
                    ),
                  );
                },childCount: titles.length),
              itemExtent: 50.0
          ),
        ],
      )
    );
  }
}