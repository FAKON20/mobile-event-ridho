import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/toast_notif.dart';

class AddDataFest extends StatefulHookConsumerWidget {
  const AddDataFest({super.key});

  @override
  ConsumerState<AddDataFest> createState() => _AddDataFestState();
}

class _AddDataFestState extends ConsumerState<AddDataFest> {
  @override
  Widget build(BuildContext context) {

    final txtTitle = useTextEditingController();
    final txtAlamat = useTextEditingController();
    final txtContent = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data Festival'),
      ),
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
                  TextField(
                    controller: txtTitle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Nama event'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input Nama event',
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
                    controller: txtAlamat,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Alamat Event'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Input Alamat Event',
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
                    controller: txtContent,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: EMColors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      label: const Text('Konten/Penjelasan Event'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Konten/Penjelasan Event',
                      fillColor: Colors.white70,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  EMButton(
                      text: 'Tambah Data',
                      textSize: 14,
                      onTap: () async{
                        if(txtTitle.text.isNotEmpty && txtAlamat.text.isNotEmpty && txtContent.text.isNotEmpty){
                          final FirebaseFirestore db = FirebaseFirestore.instance;
                          final CollectionReference data = db.collection('dataBooking');
                          final Map<String, dynamic> userBook = {
                            'title': txtTitle.text,
                            'alamat': txtAlamat.text,
                            'content': txtContent.text,
                            'ulasan': [],
                            'booking': 0,};
                        //   name: dataSnap.name,
                        // alamat: dataSnap.alamat,
                        // content: dataSnap.content,
                        // ulasan: dataSnap.ulasan,
                        // booking: dataSnap.booking)
                          await data.doc(txtTitle.text).set(userBook).then((result){
                            ToastNotification.CustomSuccess(text: 'Data berhasil ditambahkan');
                            txtTitle.clear();
                            txtContent.clear();
                            txtAlamat.clear();
                          });
                        } else {
                          ToastNotification.CustomError(text: 'Mohon mengisi data dengan lengkap');

                        }

                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
