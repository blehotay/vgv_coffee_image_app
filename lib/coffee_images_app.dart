import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_cubit.dart';
import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_screen.dart';

import 'package:vgv_coffee_image_app/favorites/screens/favorites_screen.dart';
import 'package:vgv_coffee_image_app/favorites/screens/favorites_cubit.dart';

class CoffeeImagesApp extends StatelessWidget {
  const CoffeeImagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeImageCubit>(
          create: (context) => CoffeeImageCubit(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.black87),
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black87),
          canvasColor: Colors.black87,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        routes: {
          '/favorites': (_) => const FavoritesScreen(),
        },
        home: const CoffeeImageScreen(),
      ),
    );
  }
}
