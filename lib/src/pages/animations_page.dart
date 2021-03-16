import 'dart:math' as Math;

import 'package:flutter/material.dart';


class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animationRotate;

  @override
  void initState() {
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));

    animationRotate = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut)
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        //animationController.reverse();
        animationController.reset();
      }
    //else if (animationController.status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //   }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: animationRotate.value,
          child: _Rectangle()
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.green
       ),
     );
   }
}