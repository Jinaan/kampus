import 'package:shared_preferences/shared_preferences.dart';
import 'recomendationSites.dart';

class FavoriteSitesManager {
  static const String _favoritesKey = 'favorite_sites';

  Future<List<RecommendedSite>> getFavoriteSites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteSitesJson = prefs.getStringList(_favoritesKey);

    if (favoriteSitesJson == null) {
      return [];
    }

    return favoriteSitesJson
        .map((json) => RecommendedSite.fromJson(json))
        .toList();
  }

  Future<void> addFavoriteSite(RecommendedSite site) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteSitesJson = prefs.getStringList(_favoritesKey) ?? [];

    favoriteSitesJson.add(site.toJson());
    await prefs.setStringList(_favoritesKey, favoriteSitesJson);
  }

  Future<void> removeFavoriteSite(RecommendedSite site) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteSitesJson = prefs.getStringList(_favoritesKey);

    if (favoriteSitesJson != null) {
      favoriteSitesJson.removeWhere((json) => json == site.toJson());
      await prefs.setStringList(_favoritesKey, favoriteSitesJson);
    }
  }

  Future<void> toggleFavoriteSite(RecommendedSite site) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteSitesJson = prefs.getStringList(_favoritesKey) ?? [];

    if (favoriteSitesJson.contains(site.toJson())) {
      favoriteSitesJson.remove(site.toJson());
    } else {
      favoriteSitesJson.add(site.toJson());
    }

    await prefs.setStringList(_favoritesKey, favoriteSitesJson);
  }
}
