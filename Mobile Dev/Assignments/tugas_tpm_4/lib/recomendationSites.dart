import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FavoriteSitesManager.dart';

class RecommendedSite {
  final String imageUrl;
  final String name;
  final String link;

  RecommendedSite({
    required this.imageUrl,
    required this.name,
    required this.link,
  });

  factory RecommendedSite.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return RecommendedSite(
      imageUrl: map['imageUrl'],
      name: map['name'],
      link: map['link'],
    );
  }

  String toJson() {
    return jsonEncode({
      'imageUrl': imageUrl,
      'name': name,
      'link': link,
    });
  }
}

class RecommendedSitesWidget extends StatefulWidget {
  final List<RecommendedSite> sites;
  final FavoriteSitesManager favoriteManager = FavoriteSitesManager();

  RecommendedSitesWidget({required this.sites});

  @override
  _RecommendedSitesWidgetState createState() => _RecommendedSitesWidgetState();
}

class _RecommendedSitesWidgetState extends State<RecommendedSitesWidget> {
  late List<RecommendedSite> _favoriteSites;

  @override
  void initState() {
    super.initState();
    _loadFavoriteSites();
  }

  Future<void> _loadFavoriteSites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteSitesJson = prefs.getStringList('favorite_sites');

    if (favoriteSitesJson == null) {
      setState(() {
        _favoriteSites = [];
      });
    } else {
      setState(() {
        _favoriteSites = favoriteSitesJson
            .map((json) => RecommendedSite.fromJson(json))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.sites.length,
      itemBuilder: (context, index) {
        final RecommendedSite site = widget.sites[index];
        final isFavorite = _isSiteFavorite(site);

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(site.imageUrl),
            ),
            title: Text(site.name),
            subtitle: Text(site.link),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => _toggleFavorite(site, isFavorite),
            ),
          ),
        );
      },
    );
  }

  bool _isSiteFavorite(RecommendedSite site) {
    return _favoriteSites.any((favorite) => favorite.toJson() == site.toJson());
  }

  void _toggleFavorite(RecommendedSite site, bool isCurrentlyFavorite) {
    if (isCurrentlyFavorite) {
      _removeFavorite(site);
    } else {
      _addFavorite(site);
    }
  }

  void _addFavorite(RecommendedSite site) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteSitesJson =
        prefs.getStringList('favorite_sites') ?? [];

    String siteJson = site.toJson();
    if (!favoriteSitesJson.contains(siteJson)) {
      favoriteSitesJson.add(siteJson);
      await prefs.setStringList('favorite_sites', favoriteSitesJson);

      setState(() {
        _favoriteSites.add(site);
      });
    }
  }

  void _removeFavorite(RecommendedSite site) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteSitesJson = prefs.getStringList('favorite_sites');

    if (favoriteSitesJson != null) {
      favoriteSitesJson.removeWhere((json) => json == site.toJson());
      await prefs.setStringList('favorite_sites', favoriteSitesJson);

      setState(() {
        _favoriteSites
            .removeWhere((favorite) => favorite.toJson() == site.toJson());
      });
    }
  }
}
