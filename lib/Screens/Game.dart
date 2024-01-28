import 'dart:math';

import 'package:flipit/CustomWidgets/FlipCard.dart';
import 'package:flipit/Log/logger.dart';
import 'package:flipit/models/FlipCardModel.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget{
  const Game({super.key});

  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game> with TickerProviderStateMixin{
  
  late double screenHeight;
  late double screenWidth;
  int allowRotation = 30;
  int imageCount = 9;
  double cardSize = 85;
  late List<FlipCardModel> cards;
  late AnimationController distributorAnimationContoller;
  late Animation<double> distributorAnimation;
  bool disableTap = false;

  @override
  void initState() {
    Logger.log("", "Game Init");
    distributorAnimationContoller = AnimationController(vsync: this,
        duration: const Duration(seconds: 4));
    distributorAnimationContoller.addStatusListener((status) {
      if(status==AnimationStatus.forward){
        setState(() {
          disableTap = true;
        });
      }
    });
    distributorAnimation = Tween<double>(end:0.67,begin: 0).
    chain(CurveTween(curve: Curves.elasticOut)).
    animate(distributorAnimationContoller);
    super.initState();
  }

  @override
  void dispose() {
    distributorAnimationContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int a = 0;
    cards = List.filled(imageCount*2, 0).map((e){
      FlipCardModel card = FlipCardModel(id: a, image: "", size: Size(2,3),
                                        widget:flipCard(a++));
      return card;
    }).toList();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(body:
      Stack(children: [
        layerOne(),
        layerTwo()
      ],),);
  }

  Widget layerOne(){
    return Container(decoration: const BoxDecoration(color: Colors.blue),);
  }

  Widget layerTwo(){
    return Stack(alignment: Alignment.center,children: [
      cardAreaBackground(),
      cardArea()
    ],);
  }

  Widget cardAreaBackground(){
    return Container(margin: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 90),
      decoration: BoxDecoration(
      color: const Color.fromRGBO(30, 20, 49, 0.5),
      border: Border.all(color: Colors.black,width: 10,style: BorderStyle.solid,),
        borderRadius: BorderRadius.circular(20)
    ),);
  }

  void distribute(){
    distributorAnimationContoller..reset()..forward();
  }

  Widget tapHere(){
    return Padding(padding: EdgeInsets.zero,child: Visibility(visible: !disableTap,
      child: IgnorePointer(ignoring: disableTap,
        child: InkWell(onTap: (){
          distribute();
        },child: const Text("Tap here")),
      ),
    ),);
  }


  Widget cardArea(){
    List<Widget> stackedCards = cards.map((e){
      int id = e.id!;
      return Padding(padding: EdgeInsets.only(top: ((imageCount*2 - id)).toDouble()),child: e.widget,);
    }).toList();
    stackedCards.add(tapHere());
    return Container(margin: const EdgeInsets.only(left: 30,right: 30,bottom: 50),
      height: (6*cardSize) + (24*5),
      width: 3*(cardSize) + (24*2),
      child: Stack(alignment: Alignment.center,children:stackedCards)
    );
  }

  int calculateFactorY(int id){
    switch(id~/3){
      case 0:
        return -5;
      case 1:
        return -3;
      case 2:
        return -1;
      case 3:
        return 1;
      case 4:
        return 3;
      case 5:
        return 5;
      default:
        return 0;
    }
  }

  int calculateFactorX(int id){
    switch(id%3){
      case 0:
        return -2;
      case 2:
        return 2;
      default:
        return 0;
    }
  }

  Widget flipCard(int id){
    int factorX = calculateFactorX(id);
    int factorY = calculateFactorY(id);
    double angle = Random().nextInt(20).toDouble();
    angle = (Random().nextInt(200)%2==0)?angle:-angle;
    return AnimatedBuilder(
      animation: distributorAnimation,
      builder: (context,widget){
        return  Transform(
          alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(distributorAnimation.value*cardSize*factorX,
              distributorAnimation.value*cardSize*factorY,0)
          ..rotateZ(angle),
          child: FlipCard(front: flipCardFront(), back: flipCardBack(),
            onFlip: (state){},),
        );
      },
    );
  }

  Widget flipCardFront(){
    return SizedBox(height: cardSize,
      width: cardSize,
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(color: Colors.white,margin: const EdgeInsets.all(10),
               child: Container(decoration: BoxDecoration(color: Colors.yellow,
                                           borderRadius: BorderRadius.circular(5)),),),),
    );
  }

  Widget flipCardBack(){
    return Card(elevation: 20,shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(color: Colors.white,margin: const EdgeInsets.all(10),
        child: Container(decoration: BoxDecoration(color: Colors.yellow,
            borderRadius: BorderRadius.circular(5)),),),);
  }
}
