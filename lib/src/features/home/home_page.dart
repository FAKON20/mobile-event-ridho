import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_music/src/features/home/data/data_festival_parameters.dart';
import 'package:e_music/src/utils/colors.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/button_widget.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final selected = useState<int>(0);
    final dataFest = useState<List<DataFestivalResponse>?>(null);

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

    void init () async{
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Festival Mipa')),
        leading: const Text(''),
        actions: const [
          SizedBox(height: 20,width: 60,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                itemCount:dataFest.value?.length ?? 0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => context.pushNamed('detail',extra: {"index":i}),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: EMColors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Assets.images.bem.image(width: 70,height: 70),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( '${dataFest.value?[i].name}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                Text( '${dataFest.value?[i].alamat}',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width/1.75,
                                  child: Text( '${dataFest.value?[i].content}',
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
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
