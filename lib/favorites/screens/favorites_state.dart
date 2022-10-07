part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState extends Equatable {}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object?> get props => [];
}

class EmptyFavorites extends FavoritesState {
  @override
  List<Object?> get props => [];
}

class FavoritesLoaded extends FavoritesState {
  FavoritesLoaded(this.favorites);

  final List<CoffeeImageModel> favorites;

  @override
  List<Object?> get props => [...favorites];
}
