import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chap_app/screens/welcome_screen.dart';
import 'package:chap_app/screens/login_screen.dart';
import 'package:chap_app/screens/registration_screen.dart';
import 'package:chap_app/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
     Firebase.initializeApp();
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
         primaryColor: Color(0xFF0A0E21),
        accentColor: Color(0xFF0AE221),
        scaffoldBackgroundColor:Color(0xFF0A0E21),
      ),
     initialRoute: WelcomeScreen.id,
      routes: {
         WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen()

      },
    );
  }
}
