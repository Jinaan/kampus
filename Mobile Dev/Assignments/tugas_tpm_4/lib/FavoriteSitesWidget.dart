import 'package:flutter/material.dart';
import 'favoriteSitesManager.dart'; // Assuming this is where FavoriteSitesManager is defined
import 'recomendationSites.dart'; // Assuming this is where RecommendedSite class is defined

class FavoriteSitesWidget extends StatefulWidget {
  @override
  _FavoriteSitesWidgetState createState() => _FavoriteSitesWidgetState();
}

class _FavoriteSitesWidgetState extends State<FavoriteSitesWidget> {
  final FavoriteSitesManager _favoriteManager = FavoriteSitesManager();
  late List<RecommendedSite> _favoriteSites;

  @override
  void initState() {
    super.initState();
    _loadFavoriteSites();
  }

  Future<void> _loadFavoriteSites() async {
    final List<RecommendedSite> favoriteSites =
        await _favoriteManager.getFavoriteSites();
    setState(() {
      _favoriteSites = favoriteSites;
    });
  }

  Future<void> _toggleFavorite(RecommendedSite site) async {
    await _favoriteManager.toggleFavoriteSite(site);
    await _loadFavoriteSites();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favoriteSites.length,
      itemBuilder: (context, index) {
        final RecommendedSite site = _favoriteSites[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(site.imageUrl),
            ),
            title: Text(site.name),
            subtitle: Text(site.link),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () => _toggleFavorite(site),
            ),
          ),
        );
      },
    );
  }
}
