
import 'package:flutter/material.dart';

class FavoritesScreenButton extends StatelessWidget {
  const FavoritesScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 24),
      child: DecoratedBox(
        decoration:
        const ShapeDecoration(shape: StadiumBorder(), color: Colors.white),
        child: TextButton(
          onPressed: () => Navigator.of(context).pushNamed('/favorites'),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Text(
              'Favorites Page',
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
