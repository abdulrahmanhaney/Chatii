import 'package:chatii/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/svg/chatLogoTrans.svg',
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Chatii",
              style: TextStyle(fontFamily: 'MyFont-Medium', fontSize: 18),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.centerLeft,
            height: 70,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/profiles/profile_male.png"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Abdulrahman hany",
                      style: TextStyle(
                        color: KprimaryColor,
                        fontFamily: "MyFont-Bold",
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
