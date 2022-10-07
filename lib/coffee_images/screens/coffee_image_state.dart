part of 'coffee_image_cubit.dart';

abstract class CoffeeImageState extends Equatable {}

class CoffeeImageLoadedState extends CoffeeImageState {
  CoffeeImageLoadedState({required this.coffeeImageModel});

  final CoffeeImageModel coffeeImageModel;
  @override
  List<Object> get props => [coffeeImageModel];
}

class CoffeeImageLoadingState extends CoffeeImageState {
  @override
  List<Object?> get props => [];
}

class CoffeeImageError extends CoffeeImageState {
  @override
  List<Object?> get props => [];
}
