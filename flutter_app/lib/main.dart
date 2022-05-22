import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Parcar',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(flex: 3, child: topStack()),
        Expanded(
          flex: 2,
          child: bottomSection(),
        )
      ],
    ));
  }
}

Widget topStack() {
  return Stack(
    children: <Widget>[
      Column(
        children: <Widget>[
          Expanded(flex: 9, child: topTextStack()),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    ],
  );
}

Widget topTextStack() {
  return Stack(
    children: <Widget>[
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/topbg.png"), fit: BoxFit.cover)),
      ),
      const Positioned.fill(
          child: Align(
        alignment: Alignment.center,
        child: Text('dsadasdass'),
      ))
    ],
  );
}

Widget bottomSection() {
  return Container(
    color: Colors.white,
  );
}

Color primaryColor = const Color.fromARGB(255, 85, 74, 240);
