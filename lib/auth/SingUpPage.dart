import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaran/auth/SingInPage.dart';
import 'package:qaran/auth/verifaction_screen.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 89),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90, bottom: 29),
            child: Image.asset(
              'assets/sl.png',
              height: 150,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("SingUp Page",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Full Name", prefixIcon: Icon(Icons.person)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Phone Number", prefixIcon: Icon(Icons.numbers)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Email", prefixIcon: Icon(Icons.email)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 47),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Password", prefixIcon: Icon(Icons.password)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
              child: Column(children: [
                MaterialButton(
                  onPressed: () {
                    Get.to(VerificationScreen());
                  },
                  height: 55,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Singup",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I have Account"),
                    const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SingInScreen());
                        },
                        child: const Text(
                          "SingIn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ])),
          const Spacer(),
        ],
      ),
    );
  }
}
