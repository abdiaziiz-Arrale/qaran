import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaran/Home/home.dart';
import 'package:qaran/auth/onboarding_screen.dart';
import 'package:qaran/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDZW1sb4dQSUKE72tuOtvirZDKhK9w0JJ0",
          authDomain: "govermentapp-e06fa.firebaseapp.com",
          projectId: "govermentapp-e06fa",
          storageBucket: "govermentapp-e06fa.appspot.com",
          messagingSenderId: "355734039473",
          appId: "1:355734039473:web:3fb8d28684910c4d13eb90",
          measurementId: "G-9SN432KTCS"

      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const OnboardingScreen(),
    );
  }
}
