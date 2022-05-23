import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Parcar',
      home: const MainScreen(),
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
    alignment: Alignment.center,
    children: <Widget>[
      Column(
        children: <Widget>[
          Expanded(flex: 1, child: topTextStack()),
          Container(
            color: Colors.white,
            height: 60,
          ),
        ],
      ),
      Positioned(
          bottom: 0,
          child: Align(
            alignment: Alignment.center,
            child: socialMediaIcons(),
          ))
    ],
  );
}

Widget topTextStack() {
  return Stack(
    children: <Widget>[
      Container(
        color: primaryColor,
      ),
      Positioned.fill(
          child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/logo.svg',
                        semanticsLabel: 'Parcar Logo',
                        height: 22,
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Par'),
                            TextSpan(
                                text: 'car',
                                style: TextStyle(fontWeight: FontWeight.w200)),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Find yourself a perfect spot to '),
                            TextSpan(
                                text: 'parc!',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )),
                  const SizedBox(height: 70),
                  currentParkingSpaces(),
                ],
              ))),
    ],
  );
}

Widget socialMediaIcons() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromARGB(255, 24, 119, 242)),
              width: 48,
              height: 48,
              child: Center(
                child: Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/facebook.svg',
                    semanticsLabel: 'facebook',
                  ),
                ),
              )),
          const SizedBox(width: 40),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              width: 48,
              height: 48,
              child: Center(
                child: Container(
                  width: 23,
                  height: 23,
                  child: SvgPicture.asset(
                    'assets/google.svg',
                    semanticsLabel: 'google',
                  ),
                ),
              )),
          const SizedBox(width: 40),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromARGB(255, 29, 161, 242)),
              width: 48,
              height: 48,
              child: Center(
                child: Container(
                  width: 24,
                  height: 20,
                  child: SvgPicture.asset(
                    'assets/twitter.svg',
                    semanticsLabel: 'twitter',
                  ),
                ),
              ))
        ],
      ),
      const SizedBox(height: 25),
      Text(
        'Sign in through social media',
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      )
    ],
  );
}

Widget currentParkingSpaces() {
  return Row(
    children: <Widget>[
      const Spacer(),
      Column(
        children: const <Widget>[
          Text('524',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Text('POZNAN',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ],
      ),
      const Spacer(),
      Column(
        children: const <Widget>[
          Text('2562',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Text('LOS ANGELES',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ],
      ),
      const Spacer(),
      Column(
        children: const <Widget>[
          Text('962',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Text('PRAGUE',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ],
      ),
      const Spacer(),
    ],
  );
}

Widget bottomSection() {
  return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.red,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      print('pressed!');
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(top: 17, bottom: 17),
                        child: Text('Sign in',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)))),
              ),
            ),
          )
        ],
      ));
}

Color primaryColor = const Color.fromARGB(255, 85, 74, 240);
