import 'package:flutter/material.dart';

import 'mainMenuButton.dart';
import 'memberWidget.dart';
import 'oddEvenPage.dart';
import 'triangle.dart';
import 'recomendationSites.dart';
import 'FavoriteSitesWidget.dart';

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
              content: RecommendedSitesWidget(
                sites: [
                  RecommendedSite(
                    imageUrl: 'images/barbara.jpg',
                    name: 'Flutter',
                    link: 'https://flutter.dev',
                  ),
                  RecommendedSite(
                    imageUrl: 'images/barbara.jpg',
                    name: 'Dart',
                    link: 'https://dart.dev',
                  ),
                  RecommendedSite(
                    imageUrl: 'images/barbara.jpg',
                    name: 'Material Design',
                    link: 'https://material.io',
                  ),
                ],
              ),
            ),
            MainMenuButton(
              icon: Icons.favorite,
              title: 'Favorite',
              content: FavoriteSitesWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
