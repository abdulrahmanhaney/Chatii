import 'package:chatii/consts.dart';
import 'package:chatii/screens/login_screen.dart';
import 'package:chatii/screens/rigester_screen.dart';
import 'package:chatii/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Chatii());
}

class Chatii extends StatefulWidget {
  const Chatii({super.key});

  @override
  State<Chatii> createState() => _ChatiiState();
}

class _ChatiiState extends State<Chatii> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: KprimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: KprimaryColor,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
