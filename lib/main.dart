import 'package:flutter/material.dart';
import 'package:werewolfmoderator/configs/routes.dart';
import 'package:werewolfmoderator/configs/themes.dart';
import 'package:werewolfmoderator/constants/navigation.dart';
import 'package:werewolfmoderator/bloc/theme.bloc.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:werewolfmoderator/store/state/app.state.dart';
import 'package:werewolfmoderator/screen/HomeScreen.dart';
import 'package:werewolfmoderator/screen/SplashScreen.dart';
import 'package:werewolfmoderator/constants/navigation.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StreamBuilder<Object>(
          stream: themeBloc.themeEnabled,
          builder: (context, snapshot) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: getThemeByType(Themes.light),
              home: new SplashScreen(),
              routes: <String, WidgetBuilder>{
                NavigationConstrants.HomeScreen: (BuildContext context) =>
                    new MyHomePage(
                      title: 'Giap Vo',
                    ),
              },
              debugShowCheckedModeBanner: false,
              onGenerateRoute: generateRoutes,
              //routes: routes,
              navigatorKey: NavigationConstrants.navKey,
            );
          }),
    );
  }
}
