import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_service.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_service_implement.dart';
import 'package:vgv_coffee_image_app/coffee_images_app.dart';

GetIt serviceLocator = GetIt.instance;

void main() {
  _buildDependancyGraph();

  runApp(const CoffeeImagesApp());
}

void _buildDependancyGraph() {
  serviceLocator
    ..registerSingleton<CoffeeImageService>(CoffeeServiceImpl())
    ..registerSingleton<CoffeeImageRepo>(CoffeeImageRepo(
        coffeeImageService: serviceLocator<CoffeeImageService>()));
}
