import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import 'data/data_festival_parameters.dart';

class DataBookingPage extends StatefulHookConsumerWidget {
  const DataBookingPage({ required this.index,super.key});

  final int index;

  @override
  ConsumerState<DataBookingPage> createState() => _DataBookingPageState();
}

class _DataBookingPageState extends ConsumerState<DataBookingPage> {
  @override
  Widget build(BuildContext context) {

    final dataFest = useState<List<DataFestivalResponse>?>(null);


    void init () async{
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // print('data local : ${prefs.get('localRole')}');
      // print('data local : ${prefs.get('localRole').runtimeType}');
      // role.value = '${prefs.getString('localRole')}';
      DataFestivalResponse dataSnap;
      dataFest.value?.clear();
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final CollectionReference users = db.collection('dataBooking');
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
    }

    useEffect(() {
      init();
      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Booking Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: EMColors.blue,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(dataFest.value?[widget.index].name ?? '',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(dataFest.value?[widget.index].alamat ?? '',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text('Yang sudah booking : ${dataFest.value?[widget.index].booking ?? ''}',
                style: TextStyle(fontSize: 12),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
