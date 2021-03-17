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
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveRight;
  Animation<double> scale;


  @override
  void initState() {
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));

    animationRotate = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0, 0.25,curve: Curves.easeOut))
    );
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.75, 1.0,curve: Curves.easeOut))
    );

    moveRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );

    scale = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        //animationController.repeat();
        // animationController.reverse();
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
      child: _Rectangle(),
      builder: (BuildContext context, Widget childRectangle) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: animationRotate.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: scale.value,
                child: childRectangle
              ),
            )
          ),
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