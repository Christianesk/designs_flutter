import 'package:flutter/material.dart';


class AnimateSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimateSquare()
      ),
    );
  }
}

class AnimateSquare extends StatefulWidget {

  @override
  _AnimateSquareState createState() => _AnimateSquareState();
}

class _AnimateSquareState extends State<AnimateSquare> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> moveRight;
  Animation<double> moveTop;
  Animation<double> moveLeft;
  Animation<double> moveBottom;

  

  @override
  void initState() {
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0, 0.25,curve: Curves.bounceOut))
    );

    moveTop = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.25, 0.50,curve: Curves.bounceOut))
    );

    moveLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.50, 0.75,curve: Curves.bounceOut))
    );

    moveBottom = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.75, 1.0,curve: Curves.bounceOut))
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.repeat();
      }
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
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangle) {
        return Transform.translate(
          offset: Offset(moveRight.value+moveLeft.value,moveTop.value+moveBottom.value),
          child: childRectangle,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}