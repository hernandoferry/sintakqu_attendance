import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sintakqu_attendance/core/network/dio_client.dart';
import 'package:sintakqu_attendance/feature/auth/bloc/auth_bloc.dart';
import 'package:sintakqu_attendance/feature/auth/login.dart';

// import 'package:sintakqu_attendance/forgot_password.dart';
// import 'package:sintakqu_attendance/feature/register/registrasi.dart';
// import 'package:sintakqu_attendance/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(setDioClient()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        // home: SplashScreen(),
        // home: Registrasi(),
        // home: ForgotPassword(),
        home: Login(),
      ),
    );
  }
}
