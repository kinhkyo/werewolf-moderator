import 'package:werewolfmoderator/environments/Env.dart';
import 'package:flutter/material.dart';

void main() => Production();

class Production extends Env {
  final String appName = "Flutter Starter Production";

  final String baseUrl = 'https://api.website.org';
  final Color primarySwatch = Colors.teal;
  EnvType environmentType = EnvType.PRODUCTION;

  final String dbName = 'flutterStarter.db';
}
