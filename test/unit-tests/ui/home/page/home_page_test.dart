import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/ui/home/bloc/home_bloc.dart';
import 'package:library_example/ui/home/page/home_page.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../helpers/pump_app.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late LibraryRepository libraryRepository;

  setUp(() {
    libraryRepository = LibraryRepository();
  });

  group('HomePage ', () {
    testWidgets('renders HomePage', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpHome(const HomePage(),
            libraryRepository: libraryRepository);
        await tester.pumpAndSettle();
        expect(find.byType(HomePage), findsOneWidget);
      });
    });
  });
}
