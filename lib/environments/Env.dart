import 'package:flutter/material.dart';
import 'package:werewolfmoderator/main.dart';
import 'package:werewolfmoderator/store/store.dart';
import 'package:redux/redux.dart';
import 'package:werewolfmoderator/store/state/app.state.dart';

enum EnvType { DEVELOPMENT, PRODUCTION }

class Env {
  static Env value;

  String appName;
  String baseUrl;
  Color primarySwatch;
  EnvType environmentType = EnvType.DEVELOPMENT;

  // Database Config
  int dbVersion = 1;
  String dbName;

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    final Store<AppState> store = await createStore();

    runApp(MyApp(store));
  }
}
