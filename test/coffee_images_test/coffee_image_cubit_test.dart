import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_cubit.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/main.dart';

import '../mocks.dart';

void main() {
  late CoffeeImageRepo coffeeImageRepo;
  final imageMap = {
    'file': 'https://coffee.alexflipnote.dev/EVTq_xSDuok_coffee.png'
  };
  const imageString = 'https://coffee.alexflipnote.dev/EVTq_xSDuok_coffee.png';

  setUp(() {
    coffeeImageRepo = MockCoffeeRepository();
    serviceLocator.registerSingleton<CoffeeImageRepo>(coffeeImageRepo);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  blocTest<CoffeeImageCubit, CoffeeImageState>(
      "Should emit a url string on server success",
      setUp: () {
        when(() => coffeeImageRepo.fetchImages())
            .thenAnswer((_) => Future.value(CoffeeImageModel(
                  imageMap,
                )));
      },
      build: () => CoffeeImageCubit(),
      expect: () => [
            isA<CoffeeImageLoadedState>().having(
                (state) => state.coffeeImageModel,
                "Image as we expect",
                CoffeeImageModel(imageMap)),
          ]);

  blocTest<CoffeeImageCubit, CoffeeImageState>(
      "Should Save Image url to favorite",
      setUp: () {
        when(() => coffeeImageRepo.saveFavorite(imageString))
            .thenAnswer((_) => Future.value(CoffeeImageModel(
                  imageMap,
                )));
      },
      build: () => CoffeeImageCubit(),
      act: (cubit) => cubit.saveFavorite(imageString),
      verify: (cubit) => verify(
            () => coffeeImageRepo.saveFavorite(imageString),
          ).called(2),
      expect: () => [
            isA<CoffeeImageLoadedState>().having(
                (state) => state.coffeeImageModel,
                'Coffee Image Model Saved to favorites',
                CoffeeImageModel(imageMap))
          ]);

  test('Should emit error state on server error', () async {
    when(
      () => coffeeImageRepo.fetchImages(),
    ).thenThrow(Error());
    final cubit = CoffeeImageCubit();
    await pumpEventQueue();
    expect(cubit.state, CoffeeImageError());
  });
}
