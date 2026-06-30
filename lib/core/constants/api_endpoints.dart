class ApiEndpoints {
  // Ganti dengan URL Laravel API Anda (misal: http://10.0.2.2:8000/api untuk emulator Android)
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // Auth
  static const String login = '/login';
  static const String logout = '/logout';
  static const String profile = '/profile';

  // Attendance
  static const String checkIn = '/attendance/check-in';
  static const String checkOut = '/attendance/check-out';
  static const String attendanceHistory = '/attendance/history';
  static const String attendanceStatus = '/attendance/status-today';
}
