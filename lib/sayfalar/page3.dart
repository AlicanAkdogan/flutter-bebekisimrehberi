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

    var a1 = Ayarlar(1, "Contact", "contact.png");
    var a2 = Ayarlar(2, "İnformation", "information.png");
    var a3 = Ayarlar(3, "Star", "star.png");

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
            var ayarlarListesi = snapshot.data;
            return ListView.builder(
              itemCount: ayarlarListesi!.length,
              itemBuilder: (context, index) {
                var ayar = ayarlarListesi[index];
                return GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                "resimler/${ayar.ayar_icon}",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              ayar.ayar_ad,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
