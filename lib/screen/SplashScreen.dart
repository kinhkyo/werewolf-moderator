import 'package:flutter/material.dart';
import 'dart:async';
import 'package:werewolfmoderator/constants/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(NavigationConstrants.HomeScreen);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(228, 125, 210, 1),
                Color.fromRGBO(107, 58, 194, 1)
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/wolf.png'),
                width: ScreenUtil.getInstance().setWidth(60),
                height: ScreenUtil.getInstance().setHeight(85),
              ),
              Text(
                'WereWolf',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(30),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
