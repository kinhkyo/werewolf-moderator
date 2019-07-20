import 'package:flutter/material.dart';

typedef OnTapUp = void Function();

class WerewolfCard extends StatefulWidget {
  WerewolfCard(
      {Key key, this.title, this.height = 170, this.width = 140, this.onTapUp})
      : super(key: key);

  final String title;
  final double height;
  final double width;
  final OnTapUp onTapUp;
  @override
  _WerewolfCardState createState() => _WerewolfCardState();
}

class _WerewolfCardState extends State<WerewolfCard>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTapUp();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: Color.fromRGBO(158, 86, 201, 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 13.0,
                  color: Color.fromRGBO(74, 74, 74, 0.7),
                  offset: Offset(0, 15),
                  spreadRadius: -10),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}
