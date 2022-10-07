import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_cubit.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_image_app/favorites/screens/favorites_cubit.dart';

class MockCoffeeRepository extends Mock implements CoffeeImageRepo {}

class MockCoffeeCubit extends Mock implements CoffeeImageCubit {}

class MockFavoritesCubit extends Mock implements FavoritesCubit {}
