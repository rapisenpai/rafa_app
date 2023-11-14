import 'package:flutter/material.dart';
import 'package:rafa_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rafa_app/pages/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is logged in
            return HomePage();
          } else {
            // User is not logged in
            return LoginOrRegisgterPage();
          }
        },
      ),
    );
  }
}
