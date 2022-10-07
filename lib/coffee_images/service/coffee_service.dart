import '../models/coffee_image.dart';

abstract class CoffeeImageService {
  Future<CoffeeImageModel> fetchImage();
}
