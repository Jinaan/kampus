import 'package:flutter/material.dart';

class Member {
  final String nim;
  final String nama;
  final String fotoPath;

  Member({
    required this.nim,
    required this.nama,
    required this.fotoPath,
  });
}

class MemberWidget extends StatelessWidget {
  final Member member;

  MemberWidget({
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: double.infinity,
                height: 150.0, // Adjust height as needed
                color: Colors.grey[300], // Placeholder color
                child: Image.asset(
                  member.fotoPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'NIM: ${member.nim}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'Nama: ${member.nama}',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
