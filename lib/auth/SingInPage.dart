import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaran/auth/SingUpPage.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 109),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90, bottom: 29),
            child: Image.asset('assets/sl.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Login Page",
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
              child: Column(children: [
                MaterialButton(
                  onPressed: () {
                    // Get.to(SingInScreen());
                  },
                  height: 55,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have any Account's "),
                    const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SingUpScreen());
                        },
                        child: const Text(
                          "SingUp",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/google.png",
                      height: 24,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    )
                  ],
                )
              ])),
          const Spacer(),
        ],
      ),
    );
  }
}
