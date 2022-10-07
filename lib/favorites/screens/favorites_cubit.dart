import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/main.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(EmptyFavorites()) {
    loadFavorites();
  }

  final coffeeImageRepo = serviceLocator<CoffeeImageRepo>();

  Future<void> loadFavorites() async {
    final favorites = await coffeeImageRepo.fetchFavorites();
    if (favorites.isNotEmpty) {
      emit(FavoritesLoaded(favorites));
    } else {
      emit(EmptyFavorites());
    }
  }
}
