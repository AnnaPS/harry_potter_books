import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/ui/home/home_barrel.dart';

void main() {
  group('HomeStatusX', () {
    test('returns correct values for HomeStatus.initial', () {
      const status = HomeStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
    });
    test('returns correct values for HomeStatus.loading', () {
      const status = HomeStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
    });
    test('returns correct values for HomeStatus.success', () {
      const status = HomeStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isError, isFalse);
    });
    test('returns correct values for HomeStatus.error', () {
      const status = HomeStatus.error;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isTrue);
    });
  });
}
