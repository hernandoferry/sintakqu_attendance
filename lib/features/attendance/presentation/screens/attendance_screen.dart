import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/location_helper.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool _isLoading = false;
  String _statusText = 'Belum Melakukan Presensi';
  Position? _currentPosition;

  // Koordinat kantor pusat (contoh)
  final double _officeLatitude = -6.200000;
  final double _officeLongitude = 106.816666;
  final double _maxDistanceAllowed = 100.0; // maksimal 100 meter dari kantor

  Future<void> _handleAttendance({required bool isCheckIn}) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 1. Dapatkan lokasi saat ini menggunakan Helper kita
      final position = await LocationHelper.getCurrentLocation();
      setState(() {
        _currentPosition = position;
      });

      // 2. Hitung jarak ke kantor
      final distance = LocationHelper.calculateDistance(
        startLatitude: position.latitude,
        startLongitude: position.longitude,
        endLatitude: _officeLatitude,
        endLongitude: _officeLongitude,
      );

      // 3. Validasi radius
      if (distance > _maxDistanceAllowed) {
        throw Exception(
          'Anda berada di luar radius kantor (${distance.toStringAsFixed(1)}m). '
          'Maksimal radius adalah $_maxDistanceAllowed meter.'
        );
      }

      // 4. TODO: Panggil API check-in / check-out
      // Map<String, dynamic> body = {
      //   'latitude': position.latitude,
      //   'longitude': position.longitude,
      // };
      
      await Future.delayed(const Duration(seconds: 1)); // Simulasi request API

      setState(() {
        _statusText = isCheckIn ? 'Sudah Check-In' : 'Sudah Check-Out';
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${isCheckIn ? "Check-In" : "Check-Out"} sukses! Jarak: ${distance.toStringAsFixed(1)} meter.'
            ),
            backgroundColor: AppColors.accent,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Kehadiran'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Status Hari Ini',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _statusText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    if (_currentPosition != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Koordinat Anda: ${_currentPosition!.latitude.toStringAsFixed(6)}, ${_currentPosition!.longitude.toStringAsFixed(6)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Tombol Check In & Check Out
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else ...[
              ElevatedButton.icon(
                onPressed: () => _handleAttendance(isCheckIn: true),
                icon: const Icon(Icons.login),
                label: const Text('CHECK-IN'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _handleAttendance(isCheckIn: false),
                icon: const Icon(Icons.logout),
                label: const Text('CHECK-OUT'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
