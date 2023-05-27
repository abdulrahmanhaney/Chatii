import 'package:chatii/consts.dart';
import 'package:chatii/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login&register/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
            if (user == null) {
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            } else {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: KprimaryColor,
              child: SvgPicture.asset(
                'assets/images/svg/chatiiLogo.svg',
                height: 250,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Chatii",
              style: TextStyle(fontFamily: 'MyFont-Bold', fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
