import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/ui/home/home_barrel.dart';

void main() {
  group('HomeEvent', () {
    test('support comparisons', () {
      expect(HomeEvent(), HomeEvent());
    });
  });

  group('GetBookCatalog', () {
    test('support comparisons', () {
      expect(GetBookCatalog(), GetBookCatalog());
    });
  });
}
