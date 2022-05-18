import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MainView());
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          flex: 22,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                MainMessage(),
                SocialMediaSignIn(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: ButtonSection(),
          ),
          flex: 10,
        ),
        Expanded(child: ForgotPasswordText(), flex: 2)
      ]),
    );
  }
}

class SocialMediaSignIn extends StatelessWidget {
  const SocialMediaSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 29, 161, 242),
                    ),
                    alignment: Alignment.center,
                    height: 48,
                    width: 48,
                    child: Icon(
                      FontAwesomeIcons.twitter,
                      size: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                SizedBox(width: 35),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    alignment: Alignment.center,
                    height: 48,
                    width: 48,
                    child: Image.asset(
                      'lib/img/google.jpg',
                      height: 24.0,
                      fit: BoxFit.cover,
                    )),
                SizedBox(width: 35),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 24, 119, 242),
                    ),
                    alignment: Alignment.center,
                    height: 48,
                    width: 48,
                    child: Image.asset(
                      'lib/img/facebook.png',
                      height: 24.0,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Sign in through social media',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromARGB(255, 85, 74, 240)),
            )
          ],
        ));
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Forgot your password?',
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromARGB(255, 85, 74, 240)));
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 85, 74, 240),
                ),
                child: Material(
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      print('pressed');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 248, 248, 250),
                ),
                child: Material(
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      print('pressed');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 85, 74, 240)),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ));
  }
}

class MainMessage extends StatelessWidget {
  const MainMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/BG.jpg"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/img/logo.png',
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, right: 15.0),
                    child: RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                          TextSpan(text: 'Par'),
                          TextSpan(
                              text: 'car',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400)),
                        ],
                            style: const TextStyle(
                                fontSize: 32,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 238, 237, 254)))),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '1317',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color.fromARGB(255, 238, 237, 254)),
                          ),
                          Text(
                            'WARSAW',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color.fromARGB(255, 204, 201, 251)),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '202',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color.fromARGB(255, 238, 237, 254)),
                          ),
                          Text(
                            'POZNAN',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color.fromARGB(255, 204, 201, 251)),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '525',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color.fromARGB(255, 238, 237, 254)),
                          ),
                          Text(
                            'LOS ANGELES',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color.fromARGB(255, 204, 201, 251)),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Free parking spots from around the world',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color.fromARGB(255, 204, 201, 251)),
                ),
              )
            ],
          ),
        )),
        SizedBox(height: 70)
      ],
    );
  }
}
