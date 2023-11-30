import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signInBtn extends StatelessWidget {
  final Function()? onTap;
  final Color midnightNavy = Color(0xFF093623);
  final Color whisperGray = Color(0xFFFCFCFC);
  final Color silverGray = Color(0xFFA8A8A8);
  final Color vibrantRed = Color(0xFF093623);
  final String text;

  signInBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: midnightNavy,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ));
  }
}
