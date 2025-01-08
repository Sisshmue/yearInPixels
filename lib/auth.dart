import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:year_in_pixels/login_sigup.dart';
import 'homepage.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Homepage();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
