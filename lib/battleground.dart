import 'package:flutter/material.dart';
import 'package:rockpaper/pagetransition.dart';

// todo : have two separate fields for pc and user to choose rock paper or scissor ,and rock paper scissor will be animating in the mid section ..
class BattleGround extends StatefulWidget {
  BattleGround();
  int cpuscore;
  int userscore;

  BattleGround.rounds({this.cpuscore, this.userscore});
  @override
  _BattleGroundState createState() => _BattleGroundState(cpuscore, userscore);
}

class _BattleGroundState extends State<BattleGround> {
  int cpuscore;
  int userscore;

  _BattleGroundState(this.cpuscore, this.userscore);

  double customopacity = 0;
  String fontfamily = 'OdibeeSans';

  @override
  Widget build(BuildContext context) {
    double widthphone = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Text(
                'Rock paper',
                style: TextStyle(fontFamily: fontfamily, fontSize: 40),
              ), // arsenal is static funfction
              Text(
                'Scissor',
                style: TextStyle(fontSize: 20, fontFamily: fontfamily),
              )
            ]),
          ],
        ),
      ),
      // we have two sections and score card in just bewtween at the fucking end.
      body: Container(
        // always wrapp stack with in a container
        width: widthphone,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  userui('You'),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'CPU',
                      style: TextStyle(fontFamily: fontfamily, fontSize: 80),
                    ),
                  )
                ])),
            Positioned(
                top: 50,
                right: widthphone / 2,
                child: Container(
                  color: Colors.red[300],
                  height: 500,
                  width: 0.5,
                )),
            Positioned(
                // SCOREBOAD
                right: widthphone / 2 - 23,
                top: 300,
                child: Column(
                  children: [
                    Text(
                      'Score',
                      style: TextStyle(fontFamily: fontfamily, fontSize: 20),
                    ),
                    scoreboad(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget userui(String interface) {
    // plans : animation of rock paper scissor and give user to choose
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 5),
      child: Column(
        children: [
          Text(
            '$interface',
            style: TextStyle(fontFamily: fontfamily, fontSize: 30),
          ),
          // todo : rock paper scissor animation LETS ANIMATE THIS SCISSOR
          animatedbody(
            'lib/assets/rock.png',
            Colors.green,
          ),
          animatedbody(
            'lib/assets/myrock.png',
            Colors.white,
          ),
          animatedbody('lib/assets/paper.png', Colors.white),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AnimatedOpacity(
                opacity: customopacity,
                duration: Duration(seconds: 1),
                child: Text(
                  'choose',
                  style: TextStyle(
                    fontFamily: fontfamily,
                    fontSize: 25,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget animatedbody(String imagepath, Color boxcolor) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: TweenAnimationBuilder(
        onEnd: () {
          setState(() {
            customopacity = 1;
          });
        },
        duration: Duration(seconds: 1),
        curve: Curves.bounceInOut,
        tween: Tween<double>(begin: 10, end: 80),
        builder: (context, value, child) {
          return InkWell(
            onTap: () {
              PageTransition(imagepath: imagepath).nextpage(
                context,
              );
            },
            child: Container(
              height: value,
              width: value,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: boxcolor,
                  image: DecorationImage(
                      image: AssetImage(
                    '$imagepath',
                  ))),
            ),
          );
        },
      ),
    );
  }

  Widget scoreboad() {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black87, Colors.blue])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:(userscore ==null && cpuscore == null)? [Text('0'), Text('0')] :[Text('$userscore'), Text('$cpuscore')]  , 
      ),
    );
  }
}
