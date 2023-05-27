import 'package:chatii/consts.dart';
import 'package:chatii/helpers/snakeBar.dart';
import 'package:chatii/screens/chat_screen.dart';
import 'package:chatii/screens/login&register/password_reset_screen.dart';
import 'package:chatii/screens/login&register/rigester_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/custom_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 320,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: KprimaryColor,
                  child: SvgPicture.asset(
                    'assets/images/svg/chatiiLogo.svg',
                    height: 250,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Chatii",
                    style: TextStyle(fontFamily: 'MyFont-Bold', fontSize: 30),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome, To Our App",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(178, 0, 0, 0),
                      fontFamily: 'MyFont-Medium',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'MyFont-Bold',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      icon: Icons.email,
                      hint: "email",
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    CustomTextField(
                      icon: Icons.password,
                      hint: "password",
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              PasswordResetScreen.id,
                            );
                          },
                          child: const Text(
                            "Forget Your Password ?",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "MyFont-Bold",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: "Login",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          UserCredential? user = await SignIn();
                          if (user == Null) {
                          } else {
                            Navigator.pushReplacementNamed(
                                context, ChatScreen.id);
                          }
                        } else {}
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont Have An Account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "MyFont-Medium",
                            color: Color.fromARGB(202, 0, 0, 0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.id);
                          },
                          child: const Text(
                            " Register",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "MyFont-Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential?> SignIn() async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowSnakeBar(context, text: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        ShowSnakeBar(context, text: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
