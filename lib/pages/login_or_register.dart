import "package:flutter/material.dart";
import "package:rafa_app/pages/login.dart";
import "package:rafa_app/pages/register.dart";

class LoginOrRegisgterPage extends StatefulWidget {
  const LoginOrRegisgterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisgterPage> createState() => _LoginOrRegisgterPageState();
}

class _LoginOrRegisgterPageState extends State<LoginOrRegisgterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
