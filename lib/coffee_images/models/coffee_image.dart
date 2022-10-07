import 'package:equatable/equatable.dart';

class CoffeeImageModel extends Equatable {
  CoffeeImageModel(Map<String, dynamic> json)
      : imageURL = json['file'] as String;
  final String imageURL;

  @override
  List<Object?> get props => [
        imageURL,
      ];
}
