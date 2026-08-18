import 'package:flutter/material.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final _emailController = TextEditingController();
  final _inputNamaController = TextEditingController();
  final _passController = TextEditingController();
  String? _selectedDivisi;
  final List<String> _divisiList = [
    'Human Resources',
    'Finance & Accounting',
    'Marketing & Sales',
    'Information Technology',
    'Operations',
  ];

  String? _selectRoleJabatan;

  final List<String> _roleJabatanList = [
    'Staff',
    'Senior Staff',
    'Frontend Developer',
    'Kepala Divisi',
    'Backend Developer',
    'IOS Developer',
    'FullStack Developer',
    'System Analis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFB2C5FF), Color(0XFFFFFFFF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(top: 50, left: 20, right: 20),
                child: Text(
                  'Buat Akun Baru',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 67, 68, 68),
                  ),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: Text(
                  'Lengkapi data diri anda untuk memulai mencatat kehadiaran secara profesional.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0Xff434654),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              SizedBox(height: 51),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _inputNamaController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        hintText: 'Test Jhon',
                        prefixIcon: Icon(Icons.perm_identity_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Alamat Email',
                        hintText: 'example@mail.com',
                        prefixIcon: Icon(Icons.mail_outlined),
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Mohon mengisi form email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Format email tidak sesuai !';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        initialValue: _selectedDivisi,
                        hint: const Text('Pilih Divisi Kerja'),
                        decoration: const InputDecoration(
                          labelText: 'Divisi',
                          prefixIcon: Icon(Icons.business_outlined),
                          border: OutlineInputBorder(),
                        ),
                        items: _divisiList.map((String divisi) {
                          return DropdownMenuItem<String>(
                            value: divisi,
                            child: Text(divisi),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDivisi = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Divisi tidak boleh kosong!' : null,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        initialValue: _selectRoleJabatan,
                        hint: const Text('Pilih Role Jabatan'),
                        decoration: const InputDecoration(
                          labelText: 'Jabatan',
                          prefixIcon: Icon(Icons.business_outlined),
                          border: OutlineInputBorder(),
                        ),
                        items: _roleJabatanList.map((String divisi) {
                          return DropdownMenuItem<String>(
                            value: divisi,
                            child: Text(divisi),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDivisi = value;
                          });
                        },
                        validator: (value) => value == null
                            ? 'Role/ Jabatan tidak boleh kosong!'
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Mohon isi kata sandi';
                    }
                    if (value.length < 6) {
                      return 'Kata sandi harus libih dari 6 karakter !';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF003D9B),
                      foregroundColor: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'DAFTAR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
