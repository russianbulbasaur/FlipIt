import 'dart:collection';
import 'dart:js';

import 'package:flipit/Screens/Game.dart';
import 'package:flipit/Screens/Home.dart';
import 'package:flutter/cupertino.dart';

class Resources{
  static Resources? resources;
  Resources._();

  factory Resources(){
    resources ??= Resources._();
    return resources!;
  }

  Map<String,Widget> routes = {"/":const Home(),
                              "/game":const Game()};
}