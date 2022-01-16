import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/ui/home/home_barrel.dart';
import 'package:library_example/ui/home/page/home_layout.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../helpers/pump_app.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late LibraryRepository libraryRepository;
  late HomeBloc bloc;

  setUp(() {
    libraryRepository = LibraryRepository();
    bloc = MockHomeBloc();
  });

  group('HomeLayout ', () {
    testWidgets('renders HomeLayout', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpHome(
          const HomeLayout(),
        );

        expect(find.byType(HomeLayout), findsOneWidget);
      });
    });

    testWidgets('show catalog list when HomeStatus.isSuccess', (tester) async {
      when(() => bloc.state).thenReturn(
        HomeState(status: HomeStatus.success),
      );
      await mockNetworkImages(() async {
        await tester.pumpHome(
          const HomeLayout(),
        );
        await tester.pumpAndSettle();
        final catalogListView =
            tester.widget(find.byKey(const Key('catalog_list_key')));
        expect(catalogListView, isA<ListView>());
      });
    });

    testWidgets('show circular progress indicator when HomeStatus.isLoading',
        (tester) async {
      when(() => bloc.state).thenReturn(
        HomeState(status: HomeStatus.loading),
      );
      await mockNetworkImages(() async {
        await tester.pumpHome(
          const HomeLayout(),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('loader_key')), findsOneWidget);
      });
    });

    testWidgets('show error message when HomeStatus.isError', (tester) async {
      when(() => bloc.state).thenReturn(
        HomeState(status: HomeStatus.error),
      );
      await mockNetworkImages(() async {
        await tester.pumpHome(
          const HomeLayout(),
        );
        await tester.pumpAndSettle();
        expect(find.text('No data'), findsOneWidget);
      });
    });
  });
}
