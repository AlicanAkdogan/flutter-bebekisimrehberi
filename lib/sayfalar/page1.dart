import 'package:bebek_isim_rehberi_test1/Name.dart';
import 'package:bebek_isim_rehberi_test1/Namedao.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  Future<List<Name>> tumIsimleriGoster() async {
    var isimlerListesi = await Namedao().tumIsimler();

    return isimlerListesi;
  }

  Future<void> fav(int name_id, name_fav) async {
    await Namedao().favGuncelleme(name_id, name_fav);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Popüler Bebek İsimleri"),
      ),
      body: FutureBuilder<List<Name>>(
        future: tumIsimleriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var isimlerListesi = snapshot.data;
            return ListView.builder(
              itemCount: isimlerListesi!.length,
              itemBuilder: (context, index) {
                var isim = isimlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    //print("Ad = ${isim.name}");
                    //Cardview tıklama
                  },
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                isim.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(isim.name_fav),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ElevatedButton(
                                  child: Text("Deneme"),
                                  onPressed: () {
                                    //print("Tıklanan İd = ${isim.name_id}");

                                    if (isim.name_fav == "0") {
                                      //print("Favori 1");

                                      fav(isim.name_id, "1");
                                      print("${isim.name} Favoriye Eklendi");
                                    } else if (isim.name_fav == "1") {
                                      //print("Favori 2");
                                      fav(isim.name_id, "0");
                                      print("${isim.name} Favoriden Çıkarıldı");
                                    } else {
                                      print("Bilinmedik bir hat oluştu");
                                    }
                                  },
                                ),
                              ),
                              //Deneme
                            ],
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
