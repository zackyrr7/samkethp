// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/model/repository_register.dart';
import 'package:samekt/screen/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RepositoryRegister repository = RepositoryRegister();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _noHpContreoller = TextEditingController();

  bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
  bool _obscured2 = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                    height: 200,
                    width: 200,
                    child: Image(
                      image: AssetImage("assets/images/logo2.png"),
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 8, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintText: 'Nama Anda',
                                labelText: 'nama',
                                labelStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'Email Anda',
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.phone_android,
                                  color: Colors.black,
                                ),
                                hintText: 'Nomor Hp Anda',
                                labelText: 'Nomor Hp',
                                labelStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obscured,
                            focusNode: textFieldFocusNode,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.password,
                                color: Colors.black,
                              ),
                              hintText: 'Password Anda',
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.black),
                              focusColor: Colors.black,
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: _toggleObscured,
                                    child: Icon(
                                      _obscured
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: TextFormField(
                            controller: _noHpContreoller,
                            obscureText: _obscured2,
                            focusNode: textFieldFocusNode2,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.password,
                                color: Colors.black,
                              ),
                              hintText: 'Konfirmasi Password Anda',
                              labelText: 'Konfirmasi Password',
                              labelStyle: const TextStyle(color: Colors.black),
                              focusColor: Colors.black,
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: _toggleObscured2,
                                    child: Icon(
                                      _obscured2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      bool response = await repository.postRegister(
                        _emailController.text,
                        _passwordController.text,
                        _nameController.text,
                        _noHpContreoller.text,
                        _confirmPasswordController.text,
                      );

                      if (response) {
                        // ignore: use_build_context_synchronously
                        _showAlertDialogBerhasil(context);
                      } else {
                        // ignore: use_build_context_synchronously
                        _showAlertDialog(context);
                      }
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setWidth(200),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Kirim",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah memiliki Akun?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Terjadi Kesalahan"),
    content: const Text("Silahkan Coba Lagi"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_showAlertDialogBerhasil(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Registrasi berhasil"),
    content: const Text("Login Sekarang"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
