import 'package:geolocator/geolocator.dart';

class LocationHelper {
  /// Mendapatkan posisi latitude & longitude saat ini.
  /// Menangani perizinan lokasi secara otomatis.
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan GPS aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Layanan lokasi (GPS) tidak aktif.');
    }

    // Cek perizinan lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak.');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Izin lokasi ditolak secara permanen, tidak dapat meminta izin kembali.'
      );
    }

    // Ambil lokasi saat ini dengan akurasi tinggi
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }

  /// Menghitung jarak antara koordinat user dan koordinat kantor (dalam meter).
  static double calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }
}
