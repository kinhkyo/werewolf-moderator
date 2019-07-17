import 'package:werewolfmoderator/environments/Env.dart';
import 'package:flutter/material.dart';

void main() => Development();

class Development extends Env {
  final String appName = "Flutter Starter Dev";
  final String baseUrl = 'https://api.dev.website.org';
  final Color primarySwatch = Colors.pink;
  EnvType environmentType = EnvType.DEVELOPMENT;
}
