import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_cubit.dart';

class NewImageButton extends StatelessWidget {
  const NewImageButton({
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
          onPressed: context.read<CoffeeImageCubit>().loadImage,
          // onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Text(
              'New Image',
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