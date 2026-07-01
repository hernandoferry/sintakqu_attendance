import 'dart:io';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  // final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color(0XFF0055CC),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    child: _imageFile == null
                        ? const Icon(
                            Icons.male_outlined,
                            size: 50,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {}, //=> _showPickerOptions(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0050CC),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Text(
              'Budi Santoso',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181C1E),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Container(
                width: 152,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFFDAE1FF),
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 8),
                      child: Icon(
                        Icons.check_circle,
                        color: Color(0XFF003FA4),
                        size: 14,
                      ),
                    ),
                    Text(
                      "Senior UI Designer",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF003FA4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(child: SizedBox(width: 6)),
                                TextSpan(
                                  text: 'HADIR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 131, 133, 137),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Text(
                            '22',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0XFF0055CC),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(child: SizedBox(width: 6)),
                                TextSpan(
                                  text: 'ABSEN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 131, 133, 137),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 30, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(child: SizedBox(width: 6)),
                                TextSpan(
                                  text: 'IZIN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 131, 133, 137),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Text('0', style: TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // 1. KELOMPOK MENU PENGATURAN AKUN
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        // TOMBOL INFO PERSONAL
                        ListTile(
                          leading: const Icon(
                            Icons.person_outline,
                            color: Color(0XFF002B73),
                          ),
                          title: const Text('Informasi Personal'),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            // TODO: Pindahkan ke halaman Detail Informasi Personal
                            print('Informasi Personal ditekan');
                          },
                        ),
                        const Divider(
                          height: 1,
                          indent: 16,
                          endIndent: 16,
                        ), // Garis pembatas tipis
                        // TOMBOL UBAH PASSWORD
                        ListTile(
                          leading: const Icon(
                            Icons.lock_outline,
                            color: Color(0XFF002B73),
                          ),
                          title: const Text('Ubah Password'),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            // TODO: Pindahkan ke halaman Ganti Password
                            print('Ubah Password ditekan');
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.red.withValues(alpha: 0.15),
                    child: ListTile(
                      splashColor: Colors.red.withValues(alpha: 0.1),
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                      ),
                      title: const Text(
                        'Keluar dari Aplikasi',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.red,
                      ),
                      onTap: () {
                        // _showLogoutDialog(
                        // context,
                        // ); // Memanggil dialog konfirmasi Anda
                      },
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Versi Aplikasi: 1.0.0',
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
