import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_service.dart';

class CoffeeImageRepo {
  final favoritesKey = 'favoritesKey';

  CoffeeImageRepo({required this.coffeeImageService});

  final CoffeeImageService coffeeImageService;

  Future<CoffeeImageModel> fetchImages() async {
    final image = coffeeImageService.fetchImage();
    return image;
  }

  Future<void> saveFavorite(String imageUrl) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final favorites = sharedPrefs.getStringList(favoritesKey) ?? []
      ..add(imageUrl);
    await sharedPrefs.setStringList(favoritesKey, favorites);
  }

  Future<List<CoffeeImageModel>> fetchFavorites() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final favorites = sharedPrefs.getStringList(favoritesKey) ?? [];
    return favorites
        .map((imageUrl) => CoffeeImageModel({
              'file': imageUrl,
            }))
        .toList();
  }
}
