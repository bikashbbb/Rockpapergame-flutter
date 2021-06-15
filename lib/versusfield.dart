import 'package:flutter/material.dart';
import 'package:rockpaper/animation.dart';
// todo : add the round 1 from voice of nepal

class VsField extends StatefulWidget {
  VsField(this.clickedicon);
  String clickedicon;
  @override
  _VsFieldState createState() =>
      _VsFieldState(clickedicon); // object ma value pass gardene
}

class _VsFieldState extends State<VsField> {
  String clickedicon;
  _VsFieldState(this.clickedicon);
  double customopacity = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(

          children: [
            Positioned(
              top: 40,
              right: 130,
              child: TweenAnimationBuilder(
                onEnd: () {
                  setState(() {
                    customopacity = 1;
                  });
                },
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 10, end: 70),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  return Text(
                    'Lets Battle',
                    style: TextStyle(
                        fontSize: value,
                        fontFamily: 'OdibeeSans',
                        color: Colors.cyan),
                  );
                },
              ),
            ),
            Positioned(
              top: 300,
              left: 40,
              child: animatedtext(
                'You',
              ),
            ),
            Positioned(
                right: 40,
                top: 300,
                child: animatedtext(
                  'Player 2',
                )),
            Positioned(
                top: 290,
                left: 130,
                child: animatedtext('VS',
                    sizefont: 70, fontcolor: Colors.black12)),
            Positioned(top: 360, right: 10, child: RPCAnimation(clickedicon)),
          ],

          overflow: Overflow.visible,// animation between boths here
        ),
      ),
    ); // animation and round 1 you vs player 2
  }

  Widget animatedtext(String text,
      {double sizefont = 40.0, Color fontcolor = Colors.black}) {
    return AnimatedOpacity(
        curve: Curves.easeOutSine,
        child: Text(
          '$text ',
          style: TextStyle(
              fontFamily: 'OdibeeSans', fontSize: sizefont, color: fontcolor),
        ),
        opacity: customopacity,
        duration: Duration(seconds: 1));
  }
}
