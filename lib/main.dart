import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sintakqu_attendance/features/attendance/presentation/screens/main_shell.dart';
import 'package:sintakqu_attendance/features/auth/presentation/screens/login_screen.dart';

void main() async {
  // Pastikan Flutter binding siap sebelum operasi async
  WidgetsFlutterBinding.ensureInitialized();

  // Cek apakah token tersimpan dari sesi sebelumnya
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'auth_token');
  final bool isLoggedIn = token != null && token.isNotEmpty;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sintakqu Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Jika token ada → langsung ke MainShell, jika tidak → ke LoginScreen
      initialRoute: isLoggedIn ? '/attendanceScreen' : '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/attendanceScreen': (context) => const MainShell(),
      },
    );
  }
}
