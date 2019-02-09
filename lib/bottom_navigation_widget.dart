import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/person_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(GraveListPage())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(PersonScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _bottomNavigationColor,
          ),
          title: Text(
            '主页',
            style: TextStyle(
              color: _bottomNavigationColor
            )
          )
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            title: Text(
                '消息',
                style: TextStyle(
                    color: _bottomNavigationColor
                )
            )
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            title: Text(
                '收藏',
                style: TextStyle(
                    color: _bottomNavigationColor
                )
            )
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _bottomNavigationColor,
            ),
            title: Text(
                '我的',
                style: TextStyle(
                    color: _bottomNavigationColor
                )
            )
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
      },
      ),
    );
  }
}
