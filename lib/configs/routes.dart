import 'package:flutter/material.dart';
import 'package:werewolfmoderator/screen/HomeScreen.dart';

Route generateRoutes(RouteSettings settings) {
  print('>>>>>>');
  print(settings.arguments);
  switch (settings.name) {
    default:
      return buildRoute(
          settings,
          MyHomePage(
            title: 'sadad',
          ));
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}
