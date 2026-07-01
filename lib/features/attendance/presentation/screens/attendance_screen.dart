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
  String _statusText = 'Belum Absen';
  Position? _currentPosition;
  // Menyimpan jam masuk setelah check-in berhasil (format HH:mm)
  String _checkInTime = '--:--';
  // Menyimpan jam pulang setelah check-out berhasil (format HH:mm)
  String _checkOutTime = '--:--';

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
          'Maksimal radius adalah $_maxDistanceAllowed meter.',
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
        final now = DateTime.now();
        final timeStr =
            '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
        // Simpan jam masuk atau jam pulang sesuai jenis aksi
        if (isCheckIn) {
          _checkInTime = timeStr;
        } else {
          _checkOutTime = timeStr;
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${isCheckIn ? "Check-In" : "Check-Out"} sukses! Jarak: ${distance.toStringAsFixed(1)} meter.',
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
        title: Row(
          children: [
            Image.asset('assets/images/Container.png', height: 32),
            SizedBox(width: 8),
            Text(
              'SintakQu Attendance',
              style: TextStyle(
                color: AppColors.headerText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SELAMAT PAGI,',
              style: TextStyle(
                color: Color(0XFF585F6A),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Budi Darmawan',
              style: TextStyle(
                fontSize: 24,
                color: Color(0XFF191C1E),
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              'Senior UI Designer',
              style: TextStyle(fontSize: 14, color: Color(0XFF737685)),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 350,
              height: 320,
              child: Card(
                color: Color(0XFF003D9B),
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
                          color: AppColors.surface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _statusText,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.surface,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Tap CircleAvatar untuk memicu check-in
                      GestureDetector(
                        onTap: _isLoading
                            ? null
                            : () => _handleAttendance(isCheckIn: true),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: _isLoading
                              ? const SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Color(0XFF002B73),
                                  ),
                                )
                              : const Icon(
                                  Icons.touch_app,
                                  color: Color(0XFF002B73),
                                  size: 40,
                                ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(left: 51, right: 51),
                        child: Text(
                          'Silahkan melakukan absen masuk sebelum jam 08:00',
                          style: TextStyle(
                            color: AppColors.surface,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
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
                      ],
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
            // Baris dua kartu: JAM MASUK & JAM PULANG
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _isLoading
                        ? null
                        : () => _handleAttendance(isCheckIn: true),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _checkInTime != '--:--'
                              ? AppColors.accent
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.login_outlined,
                                    color: Color(0XFF0055CC),
                                    size: 16,
                                  ),
                                ),
                                const WidgetSpan(child: SizedBox(width: 6)),
                                TextSpan(
                                  text: 'JAM MASUK',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF0055CC),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _checkInTime,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: _checkInTime != '--:--'
                                  ? AppColors.accent
                                  : Colors.black87,
                            ),
                          ),
                          const Divider(),
                          Text(
                            _checkInTime != '--:--'
                                ? 'Check-in berhasil ✓'
                                : 'Ketuk untuk check-in',
                            style: TextStyle(
                              fontSize: 12,
                              color: _checkInTime != '--:--'
                                  ? AppColors.accent
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: _isLoading
                        ? null
                        : () => _handleAttendance(isCheckIn: false),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _checkOutTime != '--:--'
                              ? AppColors.error
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.logout_outlined,
                                    color: AppColors.error,
                                    size: 16,
                                  ),
                                ),
                                const WidgetSpan(child: SizedBox(width: 6)),
                                TextSpan(
                                  text: 'JAM PULANG',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.error,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _checkOutTime,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: _checkOutTime != '--:--'
                                  ? AppColors.error
                                  : Colors.black87,
                            ),
                          ),
                          const Divider(),
                          Text(
                            _checkOutTime != '--:--'
                                ? 'Check-out berhasil ✓'
                                : 'Ketuk untuk check-out',
                            style: TextStyle(
                              fontSize: 12,
                              color: _checkOutTime != '--:--'
                                  ? AppColors.error
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Pengumuman',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDCE3F0),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ), // Menambahkan padding vertikal agar teks tidak menempel ke atas/bawah box
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Membuat ikon dan teks sejajar di atas
                  children: [
                    const Icon(
                      Icons.announcement_outlined,
                      color: Color(
                        0XFF002B73,
                      ), // Menyesuaikan warna ikon dengan tema aplikasi Anda
                    ),
                    const SizedBox(
                      width: 8,
                    ), // Memberikan jarak horizontal antara ikon dan teks
                    // 1. WAJIB: Bungkus dengan Expanded agar konten Column tidak overflow ke kanan
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // 2. Membuat semua teks rata kiri
                        children: [
                          const Text(
                            'Update Kebijakan WFH',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2), // Jarak antar teks
                          const Text(
                            'Mulai minggu depan, pengajuan WFH wajib dilakukan H-1 melalui sistem ...',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors
                                  .black, // Warna teks abu gelap agar lebih nyaman dibaca
                            ),
                            // Opsional: Jika teks terlalu panjang dari API, Anda bisa memotongnya otomatis dengan tanda titik-titik (...)
                            // maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            '2 Jam yang lalu',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors
                                  .black54, // Warna teks waktu lebih pudar
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
