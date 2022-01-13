part of 'home_bloc.dart';

enum HomeStatus { initial, success, error, loading }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;
  bool get isLoading => this == HomeStatus.loading;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Book> bookCatalog;

  HomeState({
    this.status = HomeStatus.initial,
    List<Book>? bookCatalog,
  }) : bookCatalog = bookCatalog ?? [];

  @override
  List<Object?> get props => [status, bookCatalog];

  HomeState copyWith({
    HomeStatus? status,
    List<Book>? bookCatalog,
  }) {
    return HomeState(
      status: status ?? this.status,
      bookCatalog: bookCatalog ?? this.bookCatalog,
    );
  }
}
