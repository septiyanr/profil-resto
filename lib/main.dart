import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'RM. Sedap Rasa';
    biodata['email'] = 'venti@genshinimpact.com';
    biodata['phone'] = '+62345678910';
    biodata['image'] = 'resto.png';
    biodata['jam'] = '12.00 - 20.00';
    biodata['hari'] = 'Senin - Sabtu';
    biodata['addr'] = 'St. Freeway in side of Moonstad';
    biodata['map'] = 'https://www.google.com/maps/search/?api=1&query=-6.9825603177764375, 110.4090605121885';
    biodata['desc'] =
        "Nikmati hidangan lezat yang dibuat dari bahan segar dan autentik di RM Sedap Rasa. Suasana hangat kami sempurna untuk momen istimewa bersama keluarga atau teman. Temukan cita rasa khas yang tak terlupakan!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: Text("Aplikasi Restoran")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Colors.green, biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnContact(Icons.email, Colors.green[900],
                  "mailto:${biodata['email']}?subject=Tanya%20Seputar%20Resto"),
                  btnContact(Icons.phone, Colors.blueAccent,
                  "https://wa.me/${biodata['phone']}"),
                  btnContact(Icons.map, Colors.deepPurple, biodata['map'] ?? ""), 
                ],
              ),
              SizedBox(height: 10),
              teksKotak(Colors.green, 'Deskripsi'),
              SizedBox(height: 10),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              teksKotak(Colors.green, 'Menu'),
              SizedBox(height: 10),
              daftarMenu('-Ayam Goreng'),
              SizedBox(height: 1),
              daftarMenu('-Ikan Goreng'),
              SizedBox(height: 1),
              daftarMenu('-Opor Ayam'),
              SizedBox(height: 1),
              daftarMenu('-Sayur Sop'),
              SizedBox(height: 1),
              daftarMenu('-Es Teh/Teh anget'),
              SizedBox(height: 1),
              daftarMenu('-Es Jeruk/Jeruk Anget'),
              SizedBox(height: 10),
              teksKotak(Colors.green, 'Alamat'),
              SizedBox(height: 10),
              Text(
                biodata['addr'] ?? '',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              teksKotak(Colors.green, 'Waktu Pelayanan'),
              SizedBox(height: 10),
                Text(
                biodata['jam'] ?? '',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
               Text(
                biodata['hari'] ?? '',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),


            ],
          ),
        ),
      ),
    );
  }

  Padding daftarMenu(String pilihanmenu) {
    return Padding(
              padding: const EdgeInsets.only(left: 16.0), // Sesuaikan nilai `left` untuk mengatur jarak ke kanan
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  pilihanmenu,
                  style: TextStyle(fontSize: 17),
                ),
              ),
);
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

 void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  } 
}
