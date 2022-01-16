import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/ui/home/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockLibraryRepository extends Mock implements LibraryRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpHome(
    Widget widget, {
    LibraryRepository? libraryRepository,
  }) async {
    return await pumpWidget(
      RepositoryProvider(
        create: (_) => libraryRepository ?? MockLibraryRepository(),
        child: BlocProvider(
          create: (context) =>
              HomeBloc(repository: libraryRepository ?? MockLibraryRepository())
                ..add(GetBookCatalog()),
          child: MaterialApp(
            home: Scaffold(body: widget),
          ),
        ),
      ),
    );
  }

  Future<void> pumpRoute(
    Route<dynamic> route, {
    LibraryRepository? todosRepository,
  }) {
    return pumpHome(
      Navigator(onGenerateRoute: (_) => route),
      libraryRepository: todosRepository,
    );
  }
}
