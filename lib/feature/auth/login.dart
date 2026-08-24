import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sintakqu_attendance/feature/auth/cubit/show_hide_password_cubit_cubit.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _emailController = TextEditingController();
  final _InpSandiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF191C1E),
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsetsGeometry.only(right: 130),
                child: Text(
                  'Silahkan masuk untuk melakukan pencatatan absen.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),

              SizedBox(height: 32),
              Image.asset('assets/images/login_icon.png'),
              SizedBox(height: 32),
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
              SizedBox(height: 20),
              BlocProvider(
                create: (context) => ShowHidePasswordCubitCubit(),
                child:
                    BlocBuilder<
                      ShowHidePasswordCubitCubit,
                      ShowHidePasswordCubitState
                    >(
                      builder: (context, state) {
                        bool isObscureValue = true;
                        if (state is ShowHidePasswordCubitInitial) {
                          isObscureValue = state.isObscure;
                        }
                        return TextFormField(
                          obscureText: isObscureValue,
                          decoration: InputDecoration(
                            labelText: 'Kata Sandi',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<ShowHidePasswordCubitCubit>()
                                    .togglePasswordVisibility();
                              },
                              icon: Icon(
                                isObscureValue
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              ),

              SizedBox(height: 4),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lupa Kata Sandi ?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFF003D9B),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF003D9B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'MASUK',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFFFFFF),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(0XFF434654)),
                    children: [
                      TextSpan(
                        text: 'Belum punya akun ? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                          color: Color(0XFF003D9B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
