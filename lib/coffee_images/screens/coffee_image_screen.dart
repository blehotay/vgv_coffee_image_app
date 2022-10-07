import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_cubit.dart';
import 'package:vgv_coffee_image_app/coffee_images/widgets/add_to_favorites_button.dart';
import 'package:vgv_coffee_image_app/coffee_images/widgets/favorites_screen_button.dart';
import 'package:vgv_coffee_image_app/coffee_images/widgets/new_image_button.dart';

class CoffeeImageScreen extends StatelessWidget {
  const CoffeeImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Images'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[900],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: BlocBuilder<CoffeeImageCubit, CoffeeImageState>(
                builder: (context, state) {
                  if (state is CoffeeImageLoadedState) {
                    return CachedNetworkImage(
                      imageUrl: state.coffeeImageModel.imageURL,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is CoffeeImageLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'We are having trouble getting your coffee image',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
              )),
              BlocBuilder<CoffeeImageCubit, CoffeeImageState>(
                builder: (context, state) {
                  if (state is CoffeeImageLoadedState) {
                    return AddToFavoriteButton(
                      onTap: () {
                        context
                            .read<CoffeeImageCubit>()
                            .saveFavorite(state.coffeeImageModel.imageURL);
                        context.read<CoffeeImageCubit>().loadImage();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Image has been added to favorites.'),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [NewImageButton(), FavoritesScreenButton()],
              )
            ],
          ),
        ),
      ),
    );
  }
}




