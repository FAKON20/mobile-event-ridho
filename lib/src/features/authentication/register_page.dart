import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_music/src/features/authentication/data/users_parameters.dart';
import 'package:e_music/src/widgets/toast_notif.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';

class RegisterPage extends StatefulHookConsumerWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final txtName = useTextEditingController();
    final txtNoTelp = useTextEditingController();
    final txtEmail = useTextEditingController();
    final txtPassword = useTextEditingController();
    final txtRetryPassword = useTextEditingController();
    final obscureText = useState(true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: EMColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Assets.images.bem.image(width: 100,height: 100),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.account_circle, size: 24),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Nama Lengkap'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input Nama Lengkap',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txtNoTelp,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.account_circle, size: 24),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('No Telepon'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input No Telepo',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.account_circle, size: 24),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Email'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input Email',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txtPassword,
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.lock_rounded, size: 24),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: (){
                            obscureText.value = !obscureText.value;
                          },
                          child: Icon(
                            obscureText.value ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Kata Sandi'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input Kata Sandi',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txtRetryPassword,
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.lock_rounded, size: 24),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: (){
                            obscureText.value = !obscureText.value;
                          },
                          child: Icon(
                            obscureText.value ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Ulangi Kata Sandi'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input Kata sandi',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  SizedBox(height: 50),
                  EMButton(
                      text: 'Daftar',
                      textSize: 14,
                      onTap: () async{
                        print(txtName.value.text.isEmpty);
                        print(EmailValidator.validate(txtEmail.text));
                        if(txtName.value.text.isNotEmpty && txtEmail.value.text.isNotEmpty && txtNoTelp.value.text.isNotEmpty && txtPassword.value.text.isNotEmpty && txtRetryPassword.value.text.isNotEmpty){
                          if(EmailValidator.validate(txtEmail.text)){
                            if(txtPassword.text == txtRetryPassword.text){
                              final FirebaseFirestore db = FirebaseFirestore.instance;
                              final CollectionReference users = db.collection('users');
                              final Map<String, dynamic> userFields = {
                                'name': txtName.text,
                                'notelp': txtNoTelp.text,
                                'email': txtEmail.text,
                                'password': txtPassword.text,
                                'role': '0',
                                'bookFest' : []
                              };
                              context.goNamed('sign_in');
                              await users.doc(txtEmail.text).set(userFields).then((result){
                                ToastNotification.CustomSuccess(text: 'Pendaftaran akun anda sukses');
                              });
                            } else {
                              ToastNotification.CustomError(text: 'Periksa kata sandi anda');
                            }
                          } else {
                            ToastNotification.CustomError(text: 'Mohon isi email dengan benar');
                          }
                        } else {
                          ToastNotification.CustomError(text: 'Mohon isi dengan lengkap');
                        }
                      }),
                  SizedBox(height: 50),
                  RichText(
                    text: TextSpan(
                      text: 'Sudah punya akun? ',
                      style: TextStyle(decoration: TextDecoration.none, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.none,color: EMColors.blue),
                          recognizer: TapGestureRecognizer()..onTap = ()=> context.pushReplacementNamed('sign_in'),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
