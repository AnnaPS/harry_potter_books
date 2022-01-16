import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/repository/models/author.dart';
import 'package:library_example/repository/models/book.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements LibraryRepository {}

class MockBook extends Mock implements Book {}

void main() {
  late LibraryRepository libraryRepository;

  setUp(() {
    libraryRepository = MockRepository();
  });

  group('Library repository calls', () {
    test('Throw an Exception when something was wrong', () {
      final exception = Exception();
      when(() => libraryRepository.getBookCatalog()).thenThrow(exception);
      expect(
        () async => libraryRepository.getBookCatalog(),
        throwsA(exception),
      );
    });

    test('Get Harry Potter Books', () async {
      final bookCatalog = List.generate(
        4,
        (index) => Book(
          author: const Author(
            'J.K Rowling',
            'British',
          ),
          year: 1991,
          title: 'Harry Potter $index',
          summary: 'description',
          image: 'http:someimageurl.com',
        ),
      );
      when(
        () => libraryRepository.getBookCatalog(),
      ).thenAnswer((_) async => bookCatalog);
      expect(await libraryRepository.getBookCatalog(), bookCatalog);
    });
  });
}
