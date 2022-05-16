import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MainView());
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          flex: 12,
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
                    child: Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: Color.fromARGB(255, 66, 133, 244),
                    )),
                SizedBox(width: 35),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 66, 103, 178),
                    ),
                    alignment: Alignment.center,
                    height: 48,
                    width: 48,
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      size: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ))
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Sign in through social media',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
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
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 85, 74, 240),
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
                  )),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 248, 248, 250),
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
                  )),
            )
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
          height: 330,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/BG.jpg"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                      TextSpan(text: 'Welcome to '),
                      TextSpan(
                          text: 'Parcar',
                          style: const TextStyle(fontWeight: FontWeight.w800)),
                    ],
                        style: const TextStyle(
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 238, 237, 254)))),
              ),
              Text(
                'A new and modern way to park your car',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromARGB(255, 204, 201, 251)),
              ),
            ],
          ),
        )),
        SizedBox(height: 70)
      ],
    );
  }
}
