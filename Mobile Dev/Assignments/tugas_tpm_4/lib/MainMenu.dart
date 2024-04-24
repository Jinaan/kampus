import 'package:flutter/material.dart';

import 'mainMenuButton.dart';
import 'memberWidget.dart';
import 'oddEvenPage.dart';
import 'triangle.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainMenuButton(
              icon: Icons.people,
              title: 'Daftar Anggota',
              content: ListView(
                shrinkWrap: true,
                children: [
                  // MemberWidget(
                  //     nim: '123210106', nama: 'Muhammad Jinaan Fakhruddin', fotoPath: 'assets/diluc.jpg'),
                  // MemberWidget(nim: '123210117', nama: 'Ardan Maulana Nafia'),
                  MemberWidget(
                      member: Member(
                          nim: '123210106',
                          nama: 'Muhammad Jinaan Fakhruddin',
                          fotoPath: 'diluc.jpg')),
                  MemberWidget(
                      member: Member(
                          nim: '123210117',
                          nama: 'Ardan Maulana Nafia',
                          fotoPath: 'inazuma.jpg')),
                ],
              ),
            ),
            MainMenuButton(
              icon: Icons.star,
              title: 'Bilangan Prima',
              heights: 30,
              content: Container(
                padding: EdgeInsets.all(16.0),
                child: EvenOddCheckerWidget(),
              ),
            ),
            MainMenuButton(
              icon: Icons.border_color,
              title: 'Penghitung Segitiga',
              content: Container(
                padding: EdgeInsets.all(16.0),
                child: TriangleCalculatorWidget(),
              ),
            ),
            MainMenuButton(
              icon: Icons.web,
              title: 'Daftar Situs Rekomendasi',
              content: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Daftar Situs Rekomendasi'),
                    SizedBox(height: 20),
                    Text('1. https://www.google.com'),
                    Text('2. https://www.youtube.com'),
                    Text('3. https://www.dicoding.com'),
                    Text('4. https://www.github.com'),
                    Text('5. https://www.medium.com'),
                  ],
                ),
              ),
            ),
            MainMenuButton(
              icon: Icons.favorite,
              title: 'Favorite',
              content: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Favorite'),
                    SizedBox(height: 20),
                    Text('1. Favorite 1'),
                    Text('2. Favorite 2'),
                    Text('3. Favorite 3'),
                    Text('4. Favorite 4'),
                    Text('5. Favorite 5'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
