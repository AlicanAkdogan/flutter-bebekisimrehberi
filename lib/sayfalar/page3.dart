import 'package:bebek_isim_rehberi_test1/Ayarlar.dart';
import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  Future<List<Ayarlar>> tumAyarlariGoster() async {
    var ayarlarList = <Ayarlar>[];

    var a1 = Ayarlar(1, "Uygulamamızı Değerlendir", "star.png");
    var a2 = Ayarlar(2, "Uygulama Sürümü", "information.png");
    var a3 = Ayarlar(3, "İletişim", "contact.png");

    ayarlarList.add(a1);
    ayarlarList.add(a2);
    ayarlarList.add(a3);

    return ayarlarList;

    //Veri eklendi ve göstermek için list view eklenecek ve card view tasarlanacaktır.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ayarlar"),
      ),
      body: FutureBuilder<List<Ayarlar>>(
        future: tumAyarlariGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var ayarList = snapshot.data;
            return ListView.builder(
              itemCount: ayarList!.length,
              itemBuilder: (context, index) {
                var ayar = ayarList[index];
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      print("111");
                    } else if (index == 1) {
                      print("222");
                    } else if (index == 2) {
                      print("333");
                    }
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("resimler/${ayar.ayar_icon}"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 1, 1, 1),
                          child: Text("${ayar.ayar_ad}"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            print("Veri Gelmedi");
            return Center();
          }
        },
      ),
    );
  }
}
