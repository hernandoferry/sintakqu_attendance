import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFB2C5FF), Color(0xFFF3F6FD), Color(0xFFE1E2E4)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),

        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(top: 200, left: 57, right: 57),
                child: Image.asset(
                  'assets/images/sintakqu-attendance-logo.png',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 415),
              Text(
                'Version : 0.0.1',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF737685),
                  fontWeight: FontWeight.w700,
                ),
              ),

              Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.security_rounded,
                    size: 15,
                    color: Color(0xFF737685),
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Secure Check-in',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF737685),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
