import 'package:flip_card/flip_card.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(body:
      Column(children: [
        GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          children: [1,2,3].map((e) => flipCard()).toList(),)
      ],
      ),);
  }

  Widget flipCard(){
    return FlipCard(front: Container(color: Colors.red,), back: Container(color:Colors.yellow));
  }
}