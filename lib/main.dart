import 'package:flipit/Log/logger.dart';
import 'package:flipit/Resources.dart';
import 'package:flipit/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlipIt());
}

class FlipIt extends StatelessWidget {
  final Resources resources = Resources();

  FlipIt({super.key});

  Route generateRoute(RouteSettings setting){
    return CupertinoPageRoute(builder: (context){
      return resources.routes[setting.name]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger.log("Resources object",resources.hashCode.toString());
    return MaterialApp(
      title: 'FlipIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: "/game",
    );
  }
}