import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/colors.dart';
import '../../widgets/alert_pop_up.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/toast_notif.dart';
import '../authentication/data/users_parameters.dart';

class AccountPage extends StatefulHookConsumerWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final selected = useState<int>(1);
    final dataUsers = useState<UsersResponse?>(null);

    void onItemTapped(int index) {
      if(index != selected.value){
        selected.value = index;
        print(selected.value);
        if(selected.value == 0){
          context.pushReplacementNamed('home');
        } else {
          context.pushReplacementNamed('account');
        }
      }
    }

    void init() async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print('data local : ${prefs.get('dataLogin')}');
      print('data local : ${prefs.get('dataLogin').runtimeType}');
      final dataLocal = prefs.get('dataLogin');
      dataUsers.value = UsersResponse(
          name: '${prefs.getString('localName')}',
          notelp: '${prefs.getString('localNoTelp')}',
          email: '${prefs.getString('localEmail')}',
          password: '',
          bookFest: [],
          role: '${prefs.getString('localRole')}');
    }

    useEffect(() {
      init();
      return () {};
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: EMColors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.account_circle,size: 100,),
              ),
            ),
            // SizedBox(height: 10),
            Text('${dataUsers.value?.name}',
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: EMColors.grey,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text('Email ',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      child: Text('${dataUsers.value?.email}',
                          style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: EMColors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text('No Telp ',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      child: Text('${dataUsers.value?.notelp}',
                          style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                if(dataUsers.value?.role == '1')
                EMButton(
                    text: 'Tambah data festival',
                    textSize: 12,
                    width: MediaQuery.sizeOf(context).width/3,
                    onTap: () => context.pushNamed('addDataFest')),
                EMButton(
                    text: 'Logout',
                    width: MediaQuery.sizeOf(context).width/3,
                    backgroundColors: EMColors.red,
                    textSize: 12,
                    onTap: () async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      context.goNamed('sign_in');
                      prefs.clear();
                    }),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: EMColors.blue, size: 30),
        selectedItemColor: EMColors.blue,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: selected.value, //New
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
      ),
    );
  }
}
