import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text(
            '- ÇALIŞMALARIMIZ -',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: YemekSayfasi(), // Aşağıda fonksiyon oluşturup burada çağırıyoruz.
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
} // Stateless Classı Ünleme tıklayarak Stateful'a çevirebiliyoruz.

class _YemekSayfasiState extends State<YemekSayfasi> {
  int bc = 1;
  int bcc = 1;
  int bccc = 1;

  List<String> bcAd = ['Hot Chips', 'İstanbul', 'Hoşgeldin 2021'];
  List<String> bccAd = ['Honey Time', 'ERV', 'Wafira'];
  List<String> bcccAd = ['Lebrum', 'Sunny Side Up', 'Reha Medin'];

  void randomFoto() {
    setState(() {
      bc = Random().nextInt(3) + 1;
      bcc = Random().nextInt(3) + 1;
      bccc = Random().nextInt(3) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // Column içindeki expandedler kendi arasında eşit yer paylaşımı yaptılar.
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
                color: Colors.black,
                highlightColor: Colors.white,
                // splashColor: Colors.white,
                onPressed: () {
                  setState(() {
                    // Böyle de kullanılabilir aşağıdakilerde olduğu gibi de. (Aşağıdakilerde fonksiyon kullandım)
                    bc = Random().nextInt(3) + 1;
                    bcc = Random().nextInt(3) + 1;
                    bccc = Random().nextInt(3) + 1;
                    // 0-2 arasında + 1 yani --> 1 ile 3 arasında değer döndür.
                    //bc = bc + 1;
                    //if (bc > 3) {
                    // bc = 1;}
                    // Butonu bir özellik kazandırmak için setState fonksiyonu kullanılır.
                  });
                  print('Hot Chips');
                }, // FlatButton bir tür butondur. İçine yazdıklarımız butonumuzun ayarlarıdır.
                child: Image.asset('assets/bc$bc.png')),
          )),
          Text(
            bcAd[bc - 1],
          ),
          Container(
            width: 200,
            child: Divider(
              height: 20,
              color: Colors.black,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
                color: Colors.black,
                highlightColor: Colors.white,
                onPressed: randomFoto,
                child: Image.asset('assets/bcc$bcc.png')),
          )),
          Text(
            bccAd[bcc - 1],
          ),
          Container(
              width: 200,
              child: Divider(
                height: 20,
                color: Colors.black,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
                color: Colors.black, // Butonun arka plan renk
                highlightColor: Colors.white,
                // Butona tıklanınca olmasını istediğimiz renk.
                onPressed: randomFoto,
                child: Image.asset('assets/bccc$bccc.png')),
          )),
          Text(bcccAd[bccc - 1]),
          Container(
              width: 200,
              child: Divider(
                color: Colors.black,
                height: 20,
              )),
        ],
      ),
    );
  }
} // Stateless widget yani durumsuz widget. Uygulama esnasına değişiklikler gerçekleşmez.
// Flexiable ve Expanded --> Flutterin imajları esnetip ayarlama yaptığı widgetlerdir
// Fotoğraflar ekrana sığmadığında bu widgetleri kullanırız

// Kod Planet 6.4 Videosunda "Random" kullanımını anlatıyor. İstersen izlersin.
