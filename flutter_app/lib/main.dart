import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

void main() {
  HttpOverrides.global = MyHttpOverrides();

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
        Expanded(flex: 4, child: topStack()),
        Expanded(
          flex: 3,
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
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                  ],
                  stops: const [
                    0.0,
                    0.7
                  ])),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    primaryColor.withOpacity(0.4),
                    primaryColor.withOpacity(0.4),
                  ],
                  stops: const [
                    0.0,
                    1.0
                  ])),
        ),
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
                      height: 27,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 13),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Par'),
                          TextSpan(
                              text: 'car',
                              style: TextStyle(fontWeight: FontWeight.w400)),
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
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Find yourself a perfect spot to '),
                          TextSpan(
                            text: 'parc!',
                            style: TextStyle(fontWeight: FontWeight.w700),
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
                                builder: (context) => const SignInPage()),
                          );
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
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  signIn(id, message) async {
    var response =
        await http.get(Uri.parse("http://192.168.1.12:3000/api/users"));

    if (response.statusCode == 200) {
      return response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        const SizedBox(
          height: 80,
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: SvgPicture.asset(
                'assets/left.svg',
                semanticsLabel: 'leftArrow',
                height: 25,
                color: Colors.black,
              ),
            ),
            const Expanded(
                child: Text('Welcome back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 70),
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    autofocus: true,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Your email",
                      floatingLabelStyle: const TextStyle(
                        color: Color.fromARGB(255, 104, 103, 119),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 104, 103, 119),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: primaryColor, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(10, 0, 0, 0), width: 0.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    enableSuggestions: false,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: "Password",
                      floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 104, 103, 119),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 104, 103, 119),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: primaryColor, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(10, 0, 0, 0), width: 0.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Container(
                    height: 56,
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
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                            }

                            String result = await signIn('id', 'sa');
                            print(result);

                            if (result != null) {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 18, bottom: 18),
                              child: !_isLoading
                                  ? const Text('Sign in',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white))
                                  : spinkit)),
                    ),
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}

Color primaryColor = const Color.fromARGB(255, 85, 74, 240);
const spinkit = SpinKitRing(
  color: Colors.white,
  lineWidth: 2,
  size: 20.0,
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
