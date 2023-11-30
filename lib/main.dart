import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rafa_app/pages/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
        //theme
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ));
  }
}
