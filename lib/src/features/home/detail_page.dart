import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_music/src/features/authentication/data/users_parameters.dart';
import 'package:e_music/src/widgets/alert_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/toast_notif.dart';
import 'data/data_festival_parameters.dart';

class DetailPage extends StatefulHookConsumerWidget {
  const DetailPage({ required this.index,super.key});

  final int index;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {



  @override
  Widget build(BuildContext context) {
    final role = useState<String?>(null);
    final title = useState<String>('');
    final alamat = useState<String>('');
    final content = useState<String>('');
    final listUlasan = useState<List<dynamic>?>([]);
    final jumlahUlasan = useState<int?>(0);
    final txtUlasan = useTextEditingController();
    final booking = useState<bool>(false);
    final email = useState<String?>(null);
    final rating = useState<double>(0);
    final list = useState<List>([]);
    final dataFest = useState<List<DataFestivalResponse>?>(null);

    void refresh () async{
      UsersResponse user;
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final CollectionReference users = db.collection('dataBooking');
      final dataUser = await db.collection('users').doc(email.value).get();
      Map<String, dynamic> map = dataUser.data() as Map<String, dynamic>;
      user = UsersResponse.fromJson(map);
      list.value = user.bookFest;
      for (var result in user.bookFest) {
        if(widget.index == result){
          booking.value = true;
        }
      }
    }

    void refreshUlasan () async{
      dataFest.value?.clear();
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final CollectionReference users = db.collection('dataBooking');
      DataFestivalResponse dataSnap;
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await users.get();
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(allData);
      print(allData[0]);
      for (var result in allData) {
        Map<String, dynamic> map = result as Map<String, dynamic>;
        dataSnap = DataFestivalResponse.fromJson(map);
        print(dataSnap.name);
        dataFest.value = [...dataFest.value ?? [], DataFestivalResponse(
            name: dataSnap.name,
            alamat: dataSnap.alamat,
            content: dataSnap.content,
            ulasan: dataSnap.ulasan,
            booking: dataSnap.booking)];
      }
      jumlahUlasan.value = dataFest.value?[widget.index].ulasan?.length;
      listUlasan.value = dataFest.value?[widget.index].ulasan;
    }


    void init () async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print('data local : ${prefs.get('localRole')}');
      print('data local : ${prefs.get('localRole').runtimeType}');
      role.value = '${prefs.getString('localRole')}';
      email.value = '${prefs.getString('localEmail')}';
      DataFestivalResponse dataSnap;
      UsersResponse user;
      dataFest.value?.clear();
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final CollectionReference users = db.collection('dataBooking');
      final dataUser = await db.collection('users').doc(email.value).get();
      Map<String, dynamic> map = dataUser.data() as Map<String, dynamic>;
      user = UsersResponse.fromJson(map);
      list.value = user.bookFest;
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await users.get();
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(allData);
      print(allData[0]);
      for (var result in allData) {
        Map<String, dynamic> map = result as Map<String, dynamic>;
        dataSnap = DataFestivalResponse.fromJson(map);
        print(dataSnap.name);
        dataFest.value = [...dataFest.value ?? [], DataFestivalResponse(
            name: dataSnap.name,
            alamat: dataSnap.alamat,
            content: dataSnap.content,
            ulasan: dataSnap.ulasan,
            booking: dataSnap.booking)];
      }
      title.value = '${dataFest.value?[widget.index].name}';
      alamat.value = '${dataFest.value?[widget.index].alamat}';
      content.value = '${dataFest.value?[widget.index].content}';
      jumlahUlasan.value = dataFest.value?[widget.index].ulasan?.length;
      listUlasan.value = dataFest.value?[widget.index].ulasan;
      for (var result in user.bookFest) {
        if(widget.index == result){
          booking.value = true;
        }
      }
    }

    useEffect(() {
      init();
      return () {};
    }, []);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body:
      dataFest.value != null?
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: EMColors.white,
                    borderRadius: BorderRadius.circular(10)
          ),
                child: Assets.images.bem.image(width: 150,height: 150),

              ),
              SizedBox(height: 20),
              Center(
                child: Text(title.value,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(alamat.value,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(content.value,
                  style: TextStyle(fontSize: 12),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 50),
              Container(
                height: 2,
                width: double.infinity,
                color: EMColors.greySemiLight,
              ),
              SizedBox(height: 20),
              // Spacer(),
              if(role.value == '0' && booking.value)
              Column(
                children: [
                  Center(
                    child: Text('Scan QR ini ke petugas saat akan masuk',
                      style: TextStyle(fontSize: 14),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 20),
                  QrImageView(
                    data: '${email.value}',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: EMColors.greySemiLight,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Beri Rating & Ulasan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: EMColors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  StarRating(
                      rating: rating.value,
                      filledIcon: Icons.star,
                      halfFilledIcon: Icons.star_border,
                      emptyIcon: Icons.star_outline,
                      color: Colors.amber, // Color for filled and half-filled icons
                      borderColor: Colors.grey, // Color for empty icons
                      onRatingChanged: (ratings) {
                        print(ratings);
                        rating.value = ratings;
                      }
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtUlasan,
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
                      label: const Text('Ulasan'),
                      labelStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      hintStyle: const TextStyle(color: EMColors.grey, fontSize: 10),
                      hintText: 'Berikan ulasan',
                      fillColor: Colors.white70,
                    ),
                    // keyboardType: TextInputType.multiline,
                  ),
                  EMButton(text: 'Kirim Ulasan',
                    width: 150,
                    textSize: 14,
                      onTap: () async{
                        if(rating.value != 0 && txtUlasan.value.text.isNotEmpty){
                          final FirebaseFirestore db = FirebaseFirestore.instance;
                          // list.value.add(widget.index);
                          print('data list : ${list.value}');
                          await db.collection('dataBooking').doc('${dataFest.value?[widget.index].name}').update({"ulasan": FieldValue.arrayUnion([
                            {'id':email.value,'rating':rating.value,'ulasan':txtUlasan.text}
                          ])});
                          txtUlasan.clear();
                          rating.value = 0;
                          refreshUlasan();
                          ToastNotification.CustomSuccess(text: 'Ulasan berhasl dikirim');
                        } else {
                          ToastNotification.CustomError(text: 'Rating atau ulasan tidak boleh kosong');
                        }
                      }),
                  SizedBox(height: 20),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: EMColors.greySemiLight,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Text('Ulasan (${listUlasan.value?.length ?? 0})',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listUlasan.value?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final ulasan = listUlasan.value;
                      return ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ulasan?[index]['ulasan']),
                            SizedBox(height: 10),
                            StarRating(
                                rating: double.parse('${ulasan?[index]['rating']}'),
                                filledIcon: Icons.star,
                                halfFilledIcon: Icons.star_border,
                                emptyIcon: Icons.star_outline,
                                color: Colors.amber, // Color for filled and half-filled icons
                                borderColor: Colors.grey, // Color for empty icons
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        subtitle:Column(
                          children: [
                            Text('ulasan dari ${ulasan?[index]['id']}'),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: EMColors.greySemiLight,
                            ),
                          ],
                        ) ,
                      );
                    },
                  )

                ],
              ),
              if(role.value == '0' && !booking.value)
              EMButton(
                  text: 'Book now',
                  textSize: 14,
                  onTap: () async{
                    final FirebaseFirestore db = FirebaseFirestore.instance;
                    // list.value.add(widget.index);
                    list.value = [...list.value,widget.index];
                    print('data list : ${list.value}');
                    await db.collection('users').doc(email.value).update({"bookFest": FieldValue.arrayUnion(list.value)});
                    refresh();
                  }),
              if(role.value == '1')
                EMButton(
                    text: 'Lihat data booking',
                    textSize: 14,
                    onTap: ()=> showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return DialogGeneral(
                            width: 300,
                            text: 'Jumlah orang yang booking : ${dataFest.value?[widget.index].booking}',
                            textButton: 'Tutup',
                            ontap: ()=> context.pop(context),
                          );
                        })),
            ],
          ),
        ),
      ) : const Center(child: CircularProgressIndicator(color: EMColors.blue,)) ,
    );
  }
}
