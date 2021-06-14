import 'package:flutter/material.dart';
import 'package:rockpaper/battleground.dart';

void main() {
  runApp(MyApp());
}
// todo : plans first have a interface when app is opened like a battle ground
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Rock paper',
      theme: ThemeData.dark(),
      home: BattleGround(),
    );
  }
}
