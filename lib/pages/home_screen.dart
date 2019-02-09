import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

import '../banner_component/banner_item.dart';
import '../banner_component/pair.dart';

class GraveListPage extends StatefulWidget {
  @override
  _GraveListPageState createState() => _GraveListPageState();
}

class _GraveListPageState extends State<GraveListPage>{

  List<Pair<String, Color>> param = [
    Pair.create('1', Colors.red[500]),
    Pair.create('2', Colors.green[500]),
    Pair.create('3', Colors.blue[500]),
    Pair.create('4', Colors.yellow[500]),
    Pair.create('5', Colors.purple[500]),
  ];

  List<Map> listData = [
    {
      'title':'why',
      'personImg':'https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super',
      'info':'2019-02-09',
      'commentCount':'0',
      'imgUrl':'https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Refresh(
      onFooterRefresh: onFooterRefresh,
      onHeaderRefresh: onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}){
          return new ListView.builder(
              itemCount: listData.length * 2 + 1,
              controller: controller,
              physics: physics,
              itemBuilder: (context,i) => renderRow(i)
          );
        },
    );
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        //TODO:更新策略
       // _mCurPage++;
       // getNewsList(_mCurPage);
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        //TODO:更新策略
        //_mCurPage = 1;
        //getNewsList(_mCurPage);
      });
    });
  }
/*
  getNewsList(int curPage) {
    String url = Api.NEWS_LIST_BASE_URL;
    url += '?pageIndex=$curPage&pageSize=4';
    Http.get(url).then((res) {
      if (res != null) {
        Map<String, dynamic> map = json.decode(res);
        debugPrint("the res is" + map.toString());
        if (map['code'] == 0) {
          var msg = map['msg'];
          listTotalSize = msg['news']['total'];
          var _listData = msg['news']['data'];
          var _slideData = msg['slide'];
          setState(() {
            if (curPage == 1) {
              listData = _listData;
              slideData = _slideData;
            } else {
              List tempList = new List();
              tempList.addAll(listData);
              tempList.addAll(_listData);
              if (tempList.length >= listTotalSize) {
                tempList.add('the end');
              }
              listData = tempList;
              slideData = _slideData;
            }
          });
        }
      } else {
        debugPrint("the res is null");
      }
    });
  }
*/
  Widget renderRow(i){
    ///i=0时渲染为轮播图
    if(i == 0){
      return new Container(
        height: 180.0,
        //TODO:插入轮播图
        child: new BannerView(
            BannerItemFactory.banners(param),
            intervalDuration: Duration(seconds: 3),
        ),
      );
    }
    ///i > 0时
    i -= 1;
    ///i为奇数时，渲染分割线
    if(i.isOdd){
      return new Divider(height: 1.0,);
    }
    ///将i取整
    i = i ~/ 2;
    //TODO:得到列表数据
    var itemData = listData[i];
    ///标题行
    var titleRow = new Row(
      children: <Widget>[
        new Expanded(
            child: new Text(itemData['title'],style: TextStyle(),),//TODO:分离标题
        )
      ],
    );
    ///墓碑信息行
    var infoRow = new Row(
      children: <Widget>[
        new Container(
          ///头像
          width: 20.0,
          height: 20.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: new DecorationImage(
                image: new NetworkImage(itemData['personImg']),//TODO：分离头像链接
                fit: BoxFit.cover,
            ),
            border: new Border.all(
              color: Colors.white,
              width: 2.0,
            )
          ),
        ),
        ///时间文本
        new Padding(
            padding: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
            child: new Text(
              itemData['info'],//TODO:分离时间文本
              style: new TextStyle(),//TODO:时间文本格式
            ),
        ),
        ///评论数（由一个评论图标和具体的评论数构成）
        new Expanded(
            flex: 1,
            child: new Row(
              ///为了让评论数显示在最右侧，所以需要外面的Expanded和MainAxisAlignment
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  itemData['commentCount'],//TODO:分离评论数
                  style: TextStyle(),//TODO:评论数文本格式
                ),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                    child: new Image.asset(
                        'images/avatar_default.png',//TODO:评论图标
                        width: 16.0,
                        height: 16.0,
                    ),
                )
              ],
            )
        )
      ],
    );
    var thumbImgUrl = itemData['imgUrl'];//右侧图片
    ///默认的右侧图片
    var thumbImg = new Container(
      margin: EdgeInsets.all(10.0),
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black26,
        image: new DecorationImage(
            image: ExactAssetImage('images/avatar_default.png'),//TODO:设置默认图片
            fit: BoxFit.cover,
        ),
        border: new Border.all(
          color: Colors.white,
          width: 2.0
        )
      ),
    );
    ///如果有图片，就使用网络图片，而不是默认图片
    if(thumbImgUrl != null && thumbImgUrl.length > 0){
      thumbImg = new Container(
        //margin: EdgeInsets.all(10.0),
        //width: 60.0,
        //height: 60.0,
        decoration: new BoxDecoration(
          color: Colors.black26,
          image: new DecorationImage(
              image: new NetworkImage(thumbImgUrl),
              fit: BoxFit.cover
          ),
          border: new Border.all(
            color: Colors.black26,
            width: 2.0,
          )
        ),
      );
    }
    ///ListItem 的一行
    var row = new Row(
      children: <Widget>[
        new Expanded(
            flex: 1,
            child: new Padding(
                padding: EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    titleRow,
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                        child: infoRow,
                    )
                  ],
                ),
            )
        ),
        ///右侧图片
        new Padding(
            padding: EdgeInsets.all(6.0),
          child: new Container(
            width: 100.0,
            height: 80.0,
            color: Colors.white,
              child: new Center(
                child: thumbImg,
              ),
          ),
        )
      ],
    );
    ///用InkWell包裹row，让row可以点击
    return new InkWell(
      child: row,
      onTap: (){},//TODO:点击事件
    );
  }
}

