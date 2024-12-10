import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // Membuat instance dari Faker
  final faker = Faker();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chat List"),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            // Menggunakan faker untuk data dinamis
            return ChatItem(
              imageUrl: "https://picsum.photos/id/$index/200/300", // Gambar acak
              title: faker.person.name(), // Nama acak
              subtitle: faker.lorem.sentence(), // Kalimat acak
            );
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  // Constructor dengan tipe data yang jelas
  ChatItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl), // Gambar profil
      ),
      title: Text(title), // Nama pengirim
      subtitle: Text(subtitle), // Pesan
      trailing: Text("10:00 PM"), // Waktu tetap
    );
  }
}
