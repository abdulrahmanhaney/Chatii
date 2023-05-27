import 'package:chatii/consts.dart';
import 'package:chatii/helpers/snakeBar.dart';
import 'package:chatii/screens/login&register/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/custom_button.dart';

// ignore: must_be_immutable
class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({super.key});

  static String id = "PasswordResetScreen";
  String? email;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 320,
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 130,
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
                          "Password Reset",
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
                      onChanged: (Value) {
                        email = Value;
                      },
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                      text: "Send",
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: email!,
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } on FirebaseException catch (e) {
                            if (e.code == 'user-not-found') {
                              ShowSnakeBar(context, text: "User Not Found");
                            } else {
                              print(e.code);
                            }
                          } catch (e) {
                            print(e);
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
                          "Remembered Your Password?",
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
}
