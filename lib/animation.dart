import 'package:flutter/material.dart';
import 'package:rockpaper/Random.dart';
import 'package:rockpaper/battleground.dart';
import 'package:rockpaper/pagetransition.dart';

class RPCAnimation extends StatefulWidget {
  String whichicon;
  RPCAnimation(this.whichicon);
  @override
  _RPCAnimationState createState() => _RPCAnimationState(whichicon);
}

class _RPCAnimationState extends State<RPCAnimation>
    with SingleTickerProviderStateMixin {
  Color color_of_container = Colors.brown;
  double medalposition_top = 700;
  double medalside = 40;

  String whichicon;
  _RPCAnimationState(this.whichicon);
  double invisibleopa = 1.0;

  double paperopacity = 1;
  double scissoropacity = 0;
  double rockopacity = 0;

  double cpupaperopacity = 1;
  double cpurockopacity = 0;
  double cpuscissoropacity = 0;

  String winner;

  void result() {
    String cpuresult = Random().random(['rock', 'paper', 'scissor']);

    if (whichicon == 'lib/assets/paper.png' && cpuresult == 'rock') {
      //paper vs rock
      winner = 'You';
      setState(() {
        paperopacity = 1;
        cpurockopacity = 1;
      });
      // and to display the fcking things
    } else if (whichicon == 'lib/assets/rock.png' && cpuresult == 'rock') {
      // scissor vs rock
      setState(() {
        scissoropacity = 1;
        cpurockopacity = 1;
        winner = 'cpu';
      });
    } else if (whichicon == 'lib/assets/myrock.png' && cpuresult == 'rock') {
      //rock vs rock
      setState(() {
        rockopacity = 1;
        cpurockopacity = 1;
        winner = 'none';
      });
    } else if (whichicon == 'lib/assets/rock.png' && cpuresult == 'paper') {
      setState(() {
        // scissor vs paper
        scissoropacity = 1;
        cpupaperopacity = 1;
        winner = 'You';
      });
    } else if (whichicon == 'lib/assets/myrock.png' && cpuresult == 'paper') {
      // rock vs paper
      setState(() {
        rockopacity = 1;
        cpupaperopacity = 1;
        winner = 'cpu';
      });
    } else if (whichicon == 'lib/assets/paper.png' && cpuresult == 'paper') {
      // paper vs paper
      setState(() {
        paperopacity = 1;
        cpupaperopacity = 1;
        winner = 'none';
      });
    } else if (whichicon == 'lib/assets/rock.png' && cpuresult == 'scissor') {
      setState(() {
        // scissor vs scissor
        scissoropacity = 1;
        cpuscissoropacity = 1;
        winner = 'none';
        print(winner);
      });
    } else if (whichicon == 'lib/assets/myrock.png' && cpuresult == 'scissor') {
      setState(() {
        // rock vs scissot
        rockopacity = 1;
        cpuscissoropacity = 1;
        winner = 'You';
        print(winner);
      });
    } else if (whichicon == 'lib/assets/paper.png' && cpuresult == 'scissor') {
      // paper vs scissor
      setState(() {
        paperopacity = 1;
        cpuscissoropacity = 1;
        winner = 'cpu';
        print(winner);
      });
    }
  }

  void winnerwinner() {
    if (winner == 'You') {
      setState(() {
        medalposition_top = -140;
      });
    } else if (winner == 'cpu') {
      setState(() {
        medalside = 230;
        medalposition_top = -140;
      });
    }
  }

  Widget rock(int cpuhotw) {
    return Container(
        height: 200,
        width: 170,
        child: AnimatedOpacity(
            onEnd: () {
              winnerwinner();
            },
            opacity: cpuhotw == 1 ? rockopacity : cpurockopacity,
            duration: Duration(seconds: 1),
            child: Image.asset('lib/assets/myrock.png')));
  }

  Widget paper(int cpuhotw) {
    return Container(
        height: 200,
        width: 170,
        child: AnimatedOpacity(
            onEnd: () {
              winnerwinner();
            },
            opacity: cpuhotw == 1
                ? paperopacity
                : cpupaperopacity, // user is always in true side and cpu isin false side..
            duration: Duration(seconds: 2),
            child: Image.asset('lib/assets/paper.png')));
  }

  Widget scissor(int cpuhotw) {
    return Container(
        height: 200,
        width: 170,
        child: AnimatedOpacity(
            onEnd: () {
              winnerwinner();
            },
            opacity: cpuhotw == 1 ? scissoropacity : cpuscissoropacity,
            duration: Duration(seconds: 2),
            child: Image.asset('lib/assets/rock.png')));
  }

  @override
  void initState() {
    super.initState();
    // here i will animate

    AnimationController controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    controller.addListener(() {
      setState(() {
        invisibleopa = 0;
      });
    });
    controller.forward();
  }

  Widget medal_of_winner() {
    return AnimatedPositioned(
        onEnd: () {
          // call a function to go to another place
          PageTransition().nextpage(context, object: BattleGround());
        },
        duration: Duration(seconds: 1),
        top: medalposition_top,
        left: medalside,
        child: Container(
          height: 100,
          width: 100,
          child: Image.asset('lib/assets/winner.png'),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 20,
            color: Colors.white,
            // we will have animation here
            child: Stack(
              children: [
                Positioned(left: 20, top: 15, child: animate('you')),
                Positioned(right: 0, top: 15, child: animate('I')),
                AnimatedOpacity(
                  onEnd: () {
                    setState(() {
                      paperopacity = 0;
                      cpupaperopacity = 0;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      result();
                    });
                  },
                  opacity: invisibleopa,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'o',
                  ),
                ),
              ],
            )),
        medal_of_winner()
      ],
    );
  }

  Widget animate(String username) {
    // animate the rock,paper here
    if (username == 'you') {
      return Stack(
        children: [paper(1), scissor(1), rock(1)], // user
      );
    } else {
      // CPU
      return Stack(
        children: [
          RotatedBox(quarterTurns: 3, child: paper(0)),
          RotatedBox(quarterTurns: 2, child: scissor(0)),
          RotatedBox(quarterTurns: 0, child: rock(0)),
        ],
      );
    }
  }
}
