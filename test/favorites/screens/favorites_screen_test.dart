import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/favorites/screens/favorites_cubit.dart';
import 'package:vgv_coffee_image_app/favorites/screens/favorites_screen.dart';
import 'package:vgv_coffee_image_app/main.dart';

import '../../mocks.dart';

void main() {
  late CoffeeImageRepo coffeeImageRepo;

  late FavoritesCubit favoritesCubit;
  final imageMap = {
    'file': 'https://coffee.alexflipnote.dev/EVTq_xSDuok_coffee.png'
  };
  late List<CoffeeImageModel> favorites = [
    CoffeeImageModel(imageMap),
    CoffeeImageModel(imageMap),
    CoffeeImageModel(imageMap),
  ];

  setUp(() {
    coffeeImageRepo = MockCoffeeRepository();
    favoritesCubit = MockFavoritesCubit();
    serviceLocator.registerSingleton<CoffeeImageRepo>(coffeeImageRepo);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  group('Favorites Screen', () {
    test(
      'initial state is correct',
      () => {
        expect(
          FavoritesCubit().state,
          equals(EmptyFavorites()),
        )
      },
    );

    testWidgets('renders Favorites Screen', (tester) async {
      when(() => favoritesCubit.state).thenReturn(FavoritesLoaded(favorites));
      TestAppWrapper appWrapper = TestAppWrapper(Material(
        child: BlocProvider.value(
          value: favoritesCubit,
          child: const FavoritesScreen(),
        ),
      ));
      await tester.pumpWidget(appWrapper);
      await tester.pumpAndSettle();

      expect(find.text('Favorites'), findsOneWidget);
    });
  });
}

class TestAppWrapper extends StatelessWidget {
  final Widget child;

  const TestAppWrapper(
    this.child, {
    Key? key = const Key('test_app_wrapper_key'),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: navigatorKey,
      // debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      // theme: DynamicTheme.darkTheme,
      initialRoute: "/",
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.black87),
            bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black87),
            canvasColor: Colors.black87,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: child ?? this.child,
        );
      },
      home: child,
    );
  }
}
