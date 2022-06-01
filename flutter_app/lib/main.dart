import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

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
        Expanded(flex: 2, child: topStack()),
        Expanded(
          flex: 2,
          child: bottomSection(context),
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
        children: const <Widget>[Expanded(flex: 1, child: TopTextStack())],
      ),
    ],
  );
}

class TopTextStack extends StatefulWidget {
  const TopTextStack({Key? key}) : super(key: key);

  @override
  _TopTextStack createState() => _TopTextStack();
}

class CustomBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _TopTextStack extends State<TopTextStack> {
  int _index = 0;
  bool _dragStart = false;

  final PageController _controller = PageController();

  @override
  void initState() {
    Timer mytimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_dragStart) {
        setState(() {
          _index > 1 ? _index = 0 : _index++;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/la.jpg"), fit: BoxFit.cover))),
        IgnorePointer(
            ignoring: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/logo.svg',
                      semanticsLabel: 'Parcar Logo',
                      height: 25,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Par'),
                          TextSpan(
                              text: 'car',
                              style: TextStyle(fontWeight: FontWeight.w600)),
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
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),

                //currentParkingSpaces(_index),
              ],
            )),
      ],
    );
  }
}

Widget sliderIcons(index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: index == 0 ? Colors.white : Colors.white54,
              shape: BoxShape.circle),
        ),
        const SizedBox(width: 15),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: index == 1 ? Colors.white : Colors.white54,
              shape: BoxShape.circle),
        ),
        const SizedBox(width: 15),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: index == 2 ? Colors.white : Colors.white54,
              shape: BoxShape.circle),
        )
      ],
    ),
  );
}

Widget currentParkingSpaces(index) {
  return Row(
    children: <Widget>[
      const Spacer(),
      Column(
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 120),
            style: index == 0
                ? const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)
                : const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54),
            child: const Text('524'),
          ),
          const SizedBox(height: 10),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 120),
            style: index == 0
                ? const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)
                : const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white54),
            child: const Text('POZNAN'),
          ),
        ],
      ),
      const Spacer(),
      Column(
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 120),
            style: index == 1
                ? const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)
                : const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54),
            child: const Text('2562'),
          ),
          const SizedBox(height: 10),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 120),
            style: index == 1
                ? const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)
                : const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white54),
            child: const Text('LOS ANGELES'),
          ),
        ],
      ),
      const Spacer(),
      Column(
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 120),
            style: index == 2
                ? const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)
                : const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54),
            child: const Text('962'),
          ),
          const SizedBox(height: 10),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 120),
            style: index == 2
                ? const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)
                : const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white54),
            child: const Text('PRAGUE'),
          ),
        ],
      ),
      const Spacer(),
    ],
  );
}

Widget bottomSection(context) {
  return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/facebook.svg',
                          semanticsLabel: 'Facebook',
                          height: 18,
                          color: const Color.fromARGB(255, 66, 103, 178),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 18, bottom: 18),
                            child: Text('Sign in with Facebook',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)))
                      ],
                    )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/google.svg',
                          semanticsLabel: 'Parcar Logo',
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 18, bottom: 18),
                            child: Text('Sign in with Google',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)))
                      ],
                    )),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: primaryColor,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(top: 18, bottom: 18),
                            child: Text('Sign in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromARGB(255, 248, 248, 250),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onTap: () {
                          print('pressed!');
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Text('Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor)))),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Forgot your password?',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
          ),
        ],
      ));
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

Color primaryColor = const Color.fromARGB(255, 85, 74, 240);
