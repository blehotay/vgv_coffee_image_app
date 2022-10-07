import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/favorites/screens/favorites_cubit.dart';
import 'package:vgv_coffee_image_app/main.dart';

import '../../mocks.dart';

void main() {
  late CoffeeImageRepo coffeeImageRepo;
  final imageMap = {
    'file': 'https://coffee.alexflipnote.dev/EVTq_xSDuok_coffee.png'
  };
  final List<CoffeeImageModel> favorites = [
    CoffeeImageModel(imageMap),
    CoffeeImageModel(imageMap),
    CoffeeImageModel(imageMap),
  ];
  final List<CoffeeImageModel> emptyFavorites = [];

  setUp(() {
    coffeeImageRepo = MockCoffeeRepository();
    serviceLocator.registerSingleton<CoffeeImageRepo>(coffeeImageRepo);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  test('Should Return Empty Favorites', () async {
    when(
      () => coffeeImageRepo.fetchFavorites(),
    ).thenAnswer((_) => Future.value(emptyFavorites));
    final cubit = FavoritesCubit();
    await pumpEventQueue();
    expect(cubit.state, EmptyFavorites());
  });

  blocTest<FavoritesCubit, FavoritesState>('Should return a list of favorites',
      setUp: () {
        when(() => coffeeImageRepo.fetchFavorites())
            .thenAnswer((_) => Future.value(favorites));
      },
      build: () => FavoritesCubit(),
      expect: () => [
            isA<FavoritesLoaded>().having(
                (state) => state.favorites, 'favorites as we expect', favorites)
          ]);
}
