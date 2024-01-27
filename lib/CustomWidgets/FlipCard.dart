import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FlipCardState{
  FRONT,
  BACK
}


class FlipCard extends StatefulWidget{
  final Widget front;
  final Widget back;
  final Function? onFlip;
  FlipCard({super.key,required this.front,required this.back,this.onFlip});
  @override
  State<StatefulWidget> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>{
  @override
  Widget build(BuildContext context) {
    return widget.front;
  }
}