import 'package:chatii/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/customTextField.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static String id = "RegisterScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          color: Colors.white,
          child: ListView(
            children: [
              const SizedBox(
                height: 90,
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
              Align(
                child: Column(
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
                      hint: "Name",
                    ),
                    CustomTextField(
                      icon: Icons.email,
                      hint: "Email",
                    ),
                    CustomTextField(
                      icon: Icons.password,
                      hint: "Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 50),
                          shadowColor: KprimaryColor),
                      child: const Text(
                        "Register",
                        style:
                            TextStyle(fontFamily: 'MyFont-Bold', fontSize: 18),
                      ),
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
                            Navigator.pop(context);
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
