import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_music/src/features/authentication/data/users_parameters.dart';
import 'package:e_music/src/utils/colors.dart';
import 'package:e_music/src/widgets/toast_notif.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/button_widget.dart';

class SignInPage extends StatefulHookConsumerWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final txtUsername = useTextEditingController();
    final txtPassword = useTextEditingController();
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
              Text( 'Selamat datang di Festival Mipa',
                style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.bold
                )),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txtUsername,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(Icons.account_circle, size: 24),
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
                  SizedBox(height: 20),
                  TextField(
                    controller: txtPassword,
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(Icons.lock_rounded, size: 24),
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
                      label: const Text('Kata sandi'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input kata sandi',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  SizedBox(height: 20),
                  EMButton(
                      text: 'Sign',
                      textSize: 14,
                      onTap: () async{
                        final FirebaseFirestore db = FirebaseFirestore.instance;
                        final CollectionReference users = db.collection('users');
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        UsersResponse dataSnap;
                        if(EmailValidator.validate(txtUsername.text)){
                          await users.doc(txtUsername.text).get().then((result){
                            print('ini data user : ${result.data()}');
                            print('ini data user : ${result.data().runtimeType}');
                            if(result.data() != null){
                              Map<String, dynamic> map = result.data() as Map<String, dynamic>;
                              dataSnap = UsersResponse.fromJson(map);
                              print(dataSnap.password);
                              print(dataSnap);
                              if(dataSnap.password == txtPassword.text){
                                ToastNotification.CustomSuccess(text: 'Login Sukses');
                                prefs.setString('localName', dataSnap.name);
                                prefs.setString('localEmail', dataSnap.email);
                                prefs.setString('localNoTelp', dataSnap.notelp);
                                prefs.setString('localRole', dataSnap.role);
                                context.goNamed('home');
                              } else{
                                ToastNotification.CustomError(text: 'Email atau kata sandi salah');
                              }
                            } else {
                              ToastNotification.CustomError(text: 'Email atau kata sandi salah');
                            }
                            return null;
                          });
                        } else {
                          ToastNotification.CustomError(text: 'Mohon isi email anda dengan benar');
                        }
                      }),
                  SizedBox(height: 50),
                  RichText(
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: TextStyle(decoration: TextDecoration.none, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Daftar',
                        style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.none,color: EMColors.blue),
                      recognizer: TapGestureRecognizer()..onTap = ()=> context.pushReplacementNamed('register'),

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
