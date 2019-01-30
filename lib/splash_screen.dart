import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
                (route) => route == null
      );
    }
    });
    _controller.forward();//播放动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548860385441&di=f32425e9dd39347c17812a0da8d72b2b&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F016a065625c70232f87557019e87f6.jpg%401280w_1l_2o_100sh.jpg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
