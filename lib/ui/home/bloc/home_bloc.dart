import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/repository/models/book.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.repository,
  }) : super(HomeState()) {
    on<GetBookCatalog>(_onGetBookCatalog);
  }

  final LibraryRepository repository;

  void _onGetBookCatalog(GetBookCatalog event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(status: HomeStatus.loading),
      );
      var bookCatalog = await repository.getBookCatalog();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          bookCatalog: bookCatalog,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(status: HomeStatus.error),
      );
    }
  }
}
