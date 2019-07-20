import 'package:flutter/material.dart';
import 'package:werewolfmoderator/components/WerewolfCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _homeItems = ['New Room', 'Join Room', 'Character Group'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/avartar-default.png'),
                  height: ScreenUtil.getInstance().setHeight(36),
                  width: ScreenUtil.getInstance().setWidth(36),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hana San'),
                ),
              ],
            ),
          ),
          new Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: ScreenUtil.getInstance().setHeight(30),
              physics: new NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 30, right: 30),

              // Generate 100 widgets that display their index in the List.
              children: List.generate(_homeItems.length, (index) {
                return Center(
                  child: new WerewolfCard(
                    title: _homeItems[index],
                    width: ScreenUtil.getInstance().setWidth(140),
                    height: ScreenUtil.getInstance().setHeight(170),
                    onTapUp: () {
                      print(index);
                    },
                  ),
                );
              }),
            ),
          )
        ],
      )),
    );
  }
}
