import 'package:flutter/material.dart';
import 'package:rockpaper/versusfield.dart';

class PageTransition {
  String imagepath;
  PageTransition({this.imagepath,});

  void nextpage(BuildContext context, {var object}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (context, animation, animationtime, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.center,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationtime) {
              if (imagepath != null) {
                return VsField(imagepath);
              } else {
                return object;
              }
            }));
  }
}
