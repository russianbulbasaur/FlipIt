import 'package:flip_card/flip_card.dart';
import 'package:flipit/Log/logger.dart';
import 'package:flipit/models/FlipCardModel.dart';
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
      Container(margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min,children:[
            SizedBox(height: 200*4,
              child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
              crossAxisSpacing: 24,mainAxisSpacing: 24),
              children: List.filled(12, 0).map((e) => flipCard(null)).toList(),),
            )
          ]
          ),
        ),
      ),);
  }

  Widget flipCard(FlipCardModel? card){
    return FlipCard(front: Container(height: 10,width: 10,
      color: Colors.red,
    ), back: Container(height: 10,width: 10,color:Colors.blue),
    onFlipDone: (isFront){

    },);
  }

  Widget flipCardFront(){
    return Card();
  }
  Widget flipCardBack(){
    return Card();
  }
}