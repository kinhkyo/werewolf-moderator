import 'package:flutter/material.dart';
import 'package:werewolfmoderator/environments/Env.dart';
import 'package:werewolfmoderator/configs/routes.dart';
import 'package:werewolfmoderator/configs/themes.dart';
import 'package:werewolfmoderator/constants/navigation.dart';
import 'package:werewolfmoderator/bloc/theme.bloc.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:werewolfmoderator/store/state/app.state.dart';
import 'package:werewolfmoderator/screen/HomeScreen.dart';

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
              routes: <String, WidgetBuilder>{
                "/": (BuildContext context) => new MyHomePage(
                      title: 'Giap Vo',
                    ),
              },
              initialRoute: '/',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: generateRoutes,
              //routes: routes,
              navigatorKey: NavigationConstrants.navKey,
            );
          }),
    );
  }
}
