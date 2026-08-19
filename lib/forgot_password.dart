import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

final _inpResetMailController = TextEditingController();

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFFDAE2FF),
                child: const Icon(
                  Icons.key_outlined,
                  size: 35,
                  color: Color(0XFF003D9B),
                ),
              ),
              SizedBox(height: 11),
              Text(
                'Lupa Kata Sandi ?',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF191C1E),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Masukan alamat email yang terdaftar untuk menerima instruksi pengaturan ulang kata sandi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),

              SizedBox(height: 31),

              TextFormField(
                controller: _inpResetMailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Alamat Email',
                  hintText: 'example@mail.com',
                  prefixIcon: Icon(Icons.mail_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 380),

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF003D9B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Kirim Instruksi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 11),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Kembali ke halaman Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF003D9B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
