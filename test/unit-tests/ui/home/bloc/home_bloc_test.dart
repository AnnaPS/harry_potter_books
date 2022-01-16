import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/repository/models/book.dart';
import 'package:library_example/ui/home/home_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements LibraryRepository {}

void main() {
  late LibraryRepository libraryRepository;

  setUp(() {
    libraryRepository = MockRepository();
  });
  group('Home Bloc', () {
    test('Home bloc has [HomeStatus.initial] such a first state', () {
      expect(
        HomeState().status.isInitial,
        isTrue,
      );
    });

    test('Home bloc has [HomeStatus.initial] copyWith', () {
      expect(
        HomeState(),
        HomeState().copyWith(),
      );
    });

    blocTest<HomeBloc, HomeState>(
      'emits [HomeState.isLoading] - [HomeState.isSuccess] '
      'when repository returns a list of books',
      setUp: () {
        when(() => libraryRepository.getBookCatalog()).thenAnswer(
          (_) async => Future.value(
            <Book>[],
          ),
        );
      },
      build: () => HomeBloc(repository: libraryRepository),
      act: (bloc) => bloc.add(GetBookCatalog()),
      expect: () => <HomeState>[
        HomeState().copyWith(status: HomeStatus.loading),
        HomeState().copyWith(
          status: HomeStatus.success,
          bookCatalog: <Book>[],
        )
      ],
      verify: (_) {
        verify(
          () => libraryRepository.getBookCatalog(),
        ).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeState.isLoading] - [HomeState.isError] '
      'when repository returns throws an error',
      setUp: () {
        when(() => libraryRepository.getBookCatalog())
            .thenThrow(isA<Exception>());
      },
      build: () => HomeBloc(repository: libraryRepository),
      act: (bloc) => bloc.add(GetBookCatalog()),
      expect: () => <HomeState>[
        HomeState().copyWith(status: HomeStatus.loading),
        HomeState().copyWith(
          status: HomeStatus.error,
        )
      ],
      verify: (_) {
        verify(
          () => libraryRepository.getBookCatalog(),
        ).called(1);
      },
    );
  });
}
