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
    var a3 = Ayarlar(3, "Star", "Star.png");

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
                //Row veya colum ile tarım eklenecektir.
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
