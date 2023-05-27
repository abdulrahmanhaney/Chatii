import 'package:chatii/consts.dart';
import 'package:chatii/screens/chat_screen.dart';
import 'package:chatii/screens/home_screen.dart';
import 'package:chatii/screens/login&register/login_screen.dart';
import 'package:chatii/screens/login&register/password_reset_screen.dart';
import 'package:chatii/screens/login&register/rigester_screen.dart';
import 'package:chatii/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          iconTheme: const IconThemeData(color: Colors.white),
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
        HomeScreen.id: (context) => const HomeScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
        PasswordResetScreen.id: (context) => PasswordResetScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
