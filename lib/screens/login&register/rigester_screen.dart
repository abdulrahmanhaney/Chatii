import 'dart:js_interop';

import 'package:chatii/consts.dart';
import 'package:chatii/screens/home_screen.dart';
import 'package:chatii/screens/login&register/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../helpers/snakeBar.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/custom_button.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? name;

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
                  height: 80,
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
                          "Register Now",
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
                      icon: Icons.person,
                      hint: "name",
                      onChanged: (value) {
                        name = value;
                      },
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
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Register",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          UserCredential? user = await CreatUser();
                          if (user == null) {
                          } else {
                            FirebaseAuth.instance.currentUser!
                                .updateDisplayName(name);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
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
                          "Already Have An Account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "MyFont-Medium",
                            color: Color.fromARGB(202, 0, 0, 0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          },
                          child: const Text(
                            " Login",
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

  Future<UserCredential?> CreatUser() async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowSnakeBar(
          context,
          text: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        ShowSnakeBar(
          context,
          text: "The account already exists for that email.",
        );
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
