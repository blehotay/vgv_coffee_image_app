import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_image_app/coffee_images/screens/coffee_image_screen.dart';
import 'package:vgv_coffee_image_app/coffee_images/service/coffee_image_repo.dart';
import 'package:vgv_coffee_image_app/coffee_images_app.dart';
import 'package:vgv_coffee_image_app/main.dart';

import '../mocks.dart';

void main() {
  late CoffeeImageRepo coffeeImageRepo;

  setUp(() {
    coffeeImageRepo = MockCoffeeRepository();
    serviceLocator.registerSingleton<CoffeeImageRepo>(coffeeImageRepo);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  group('CoffeeImagesApp', () {
    testWidgets('renders CoffeeImageScreen', (tester) async {
      await tester.pumpWidget(const CoffeeImagesApp());
      expect(find.byType(CoffeeImageScreen), findsOneWidget);
    });
  });
}
