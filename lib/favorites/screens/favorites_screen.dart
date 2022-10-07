import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_image_app/favorites/screens/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Container(
        color: Colors.grey[900],
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            context.read<FavoritesCubit>().loadFavorites();
            if (state is FavoritesLoaded) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final image = state.favorites[index];
                    return CachedNetworkImage(
                      imageUrl: image.imageURL,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  });
            } else if (state is EmptyFavorites) {
              return const Center(
                child: Text(
                  'No Favorites Added',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'We are having trouble saving your favorite image, try again',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
