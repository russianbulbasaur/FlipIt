import 'package:flip_card/flip_card.dart';
import 'package:flipit/Log/logger.dart';
import 'package:flipit/models/FlipCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget{
  const Game({super.key});

  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game>{

  @override
  void initState() {
    Logger.log("", "Game Init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      SizedBox(height: MediaQuery.of(context).size.height,
        child: Column(children: [2,3,4].map((e) => flipCard()).toList()
        ),
      ),);
  }

  Widget flipCard(){
    return FlipCard(front: Container(height: 200,width: 200,
      color: Colors.red,
    ), back: Container(height: 200,width: 200,color:Colors.blue));
  }
}