import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qaran/Home/home.dart';
import 'package:qaran/auth/SingUpPage.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final error= false.obs;
  final empty= false.obs;
  final loading= false.obs;
  Future signin() async {
    loading.value = true;
    final auth = FirebaseAuth.instance;
    final email = emailcontroller.text;

    final password = passwordController.text;
    if(email.isEmpty || password.isEmpty){
      final  snackdemo = SnackBar(
        content: Text('Please Fill The Missing.'),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      loading.value = false;
      return ;
    }
    try {

      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.offAll(home());

      }

      ).catchError((onError){
        final  snackdemo = SnackBar(
          content: Text('Invalid Email Or Password.'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      });
      loading.value = false;
    } on FirebaseAuthException catch (e) {
      e.message;
      loading.value = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenheight= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: screenheight,
          child: Column(
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
                child:  TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: "Email", prefixIcon: Icon(Icons.email)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47),
                child:  TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password", prefixIcon: Icon(Icons.password)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
                  child: Column(children: [
                    Obx(
                          () => MaterialButton(
                        onPressed: () {
                          signin();
                        },
                        height: 55,
                        padding: EdgeInsets.all(10),
                        color: Colors.black,
                        child: loading.isTrue
                            ? Center(
                          child: LoadingAnimationWidget
                              .fourRotatingDots(
                              color: Colors.white, size: 30),
                        )
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              " Login ",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
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
        ),
      ),
    );
  }
}
