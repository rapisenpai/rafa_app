import 'package:flutter/material.dart';
import 'package:rafa_app/pages/card_deck.dart';
import 'package:rafa_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rafa_app/pages/login_or_register.dart';
import 'package:rafa_app/pages/stopwatch.dart';

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
            return CardDeck();
          } else {
            // User is not logged in
            return LoginOrRegisgterPage();
          }
        },
      ),
    );
  }
}
