import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> mahasiswa = [
    {
      'nama': 'Ignasius Yoga Puji',
      'nim': 'F1220220057',
      'ipk': '3.9',
      'image': 'images/foto1b.jpg',
      'Telepon': '089 672 790 123',
    },
    {
      'nama': 'Dian Restu Adji',
      'nim': 'F1220220056',
      'ipk': '3.99',
      'image': 'images/foto1a.jpeg',
      'Telepon': '089 672 890 113',
    },
    {
      'nama': 'Mukhammad Shaunan Syahidan Mubarok',
      'nim': 'F1220220070',
      'ipk': '4.3',
      'image': 'images/foto1c.jpg',
      'Telepon': '089 672 890 123',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi UTS'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: mahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = mahasiswa[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                    8), // Membuat sudut sedikit melengkung (opsional)
                child: Image.asset(
                  mhs['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(mhs['nama']!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('NIM: ${mhs['nim']}\nIPK: ${mhs['ipk']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        nama: mhs['nama']!,
                        nim: mhs['nim']!,
                        ipk: mhs['ipk']!,
                        image: mhs['image']!,
                        Telepon: mhs['Telepon']!,
                      ),
                    ),
                  );
                },
                child: Text('Cek Profil'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String nama;
  final String nim;
  final String ipk;
  final String image;
  final String Telepon;

  DetailPage({
    required this.nama,
    required this.nim,
    required this.ipk,
    required this.image,
    required this.Telepon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    8), // Membuat kotak dengan sudut melengkung
                child: Image.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(nama,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('NIM: $nim', style: TextStyle(fontSize: 18)),
              Text('IPK: $ipk', style: TextStyle(fontSize: 18)),
              Text('Telepon: $Telepon', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
