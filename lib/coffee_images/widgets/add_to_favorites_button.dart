
import 'package:flutter/material.dart';

class AddToFavoriteButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToFavoriteButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 24),
      child: DecoratedBox(
        decoration:
        const ShapeDecoration(shape: StadiumBorder(), color: Colors.white),
        child: TextButton(
          onPressed: onTap,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Text(
              'Add To Favorites',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}