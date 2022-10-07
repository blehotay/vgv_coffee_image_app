import 'dart:convert';

import 'package:http/http.dart';
import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_service.dart';

class CoffeeServiceImpl extends CoffeeImageService {
  final client = Client();
  final baseUrl = 'https://coffee.alexflipnote.dev/random.json';

  @override
  Future<CoffeeImageModel> fetchImage() async {
    final response = await client.get(Uri.parse(baseUrl));
    final responseAsJson = jsonDecode(response.body);

    return CoffeeImageModel(responseAsJson);
  }
}
