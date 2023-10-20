import 'package:bebek_isim_rehberi_test1/sayfalar/page1.dart';
import 'package:bebek_isim_rehberi_test1/sayfalar/page2.dart';
import 'package:bebek_isim_rehberi_test1/sayfalar/page3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sayfaListesi = [page1(), page2(), page3()];
  int secilenlenIndeks = 0; //ilk açılacak olan sayfa 0 - 1 - 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaListesi[secilenlenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "İsimler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoriler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ayarlar",
          ),
        ],
        currentIndex: secilenlenIndeks,
        onTap: (value) {
          print("Bottom Click");
          setState(() {
            secilenlenIndeks = value;
          });
        },
      ),
    );
  }
}
