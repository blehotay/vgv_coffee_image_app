import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';
import 'package:vgv_coffee_image_app/coffee_images/models/coffee_image.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/main.dart';

part 'coffee_image_state.dart';

class CoffeeImageCubit extends Cubit<CoffeeImageState> {
  CoffeeImageCubit() : super(CoffeeImageLoadingState()) {
    loadImage();
  }
  final coffeeImageRepo = serviceLocator<CoffeeImageRepo>();

  Future<void> loadImage() async {
    emit(CoffeeImageLoadingState());
    try {
      final imageUrl = await coffeeImageRepo.fetchImages();
      emit(CoffeeImageLoadedState(coffeeImageModel: imageUrl));
    } catch (e) {
      emit(CoffeeImageError());
    }
  }

  Future<void> saveFavorite(String imageUrl) async {
    await coffeeImageRepo.saveFavorite(imageUrl);
  }

}
