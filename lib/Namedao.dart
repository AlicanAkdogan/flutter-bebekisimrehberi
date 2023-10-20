import 'package:bebek_isim_rehberi_test1/Name.dart';
import 'package:bebek_isim_rehberi_test1/VeritabaniYardimcisi.dart';

class Namedao {
  Future<List<Name>> tumIsimler() async {
    var db = await VeritabaniYardimci.vertabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM name"); // !! kisilerv2 test !!
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      //return Kisiler(satir["kisi_id"], satir["kisi_ad"]);
      return Name(satir["name_id"], satir["name"], satir["name_fav"]);
    });
  }

  Future<void> favGuncelleme(int name_id, String fav) async {
    var db = await VeritabaniYardimci.vertabaniErisim();

    var isimler = Map<String, dynamic>();
    isimler["name_fav"] = fav;

    await db.update("name", isimler, where: "name_id=?", whereArgs: [name_id]);

    
  }

  Future<List<Name>> fav() async {
    var db = await VeritabaniYardimci.vertabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM name WHERE name_fav='1' "); // !! kisilerv2 test !!
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      //return Kisiler(satir["kisi_id"], satir["kisi_ad"]);
      return Name(satir["name_id"], satir["name"], satir["name_fav"]);
    });
  }
}
