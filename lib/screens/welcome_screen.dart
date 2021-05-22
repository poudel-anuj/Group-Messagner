import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chap_app/screens/login_screen.dart';
import 'package:chap_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chap_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation color;
  @override
  void initState() {
   
    super.initState();
    controller = AnimationController(
        // upperBound: 100.0,
        duration: Duration(seconds: 3),
        vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    color = ColorTween(begin: Colors.white70, end: Colors.red).animate(controller);

    //for reverse animation
    //controller.reverse(from: 1.0);

    controller.forward();

    //to see the status of the animation
    // animation.addStatusListener((status) {
    //    if(status == AnimationStatus.completed){
    //     controller.reverse(from:1.0);
    //   }else if(status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    //     print(status);
    //   },
    // );

    //to know what animation is doing
    controller.addListener(
      () {
        setState(() {
          // print(animation.value);
        });
      },
    );

    //used to control the resources
    // @override
    // void dispose() {
    //   controller.dispose();
    //   super.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //animation with color but remove upperbound while using
      // backgroundColor: Colors.red.withOpacity(controller.value),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    // height: animation.value *
                    //     80, // image is so small so we multiply to see effect
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Flash Chat'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Login',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
             RoundedButton(
              colour: color.value,
              title: 'Register',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

