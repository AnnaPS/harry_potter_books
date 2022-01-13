import 'package:equatable/equatable.dart';

class Author extends Equatable {
  const Author(
    this.fullName,
    this.nationality,
  );

  final String fullName;
  final String nationality;

  @override
  List<Object?> get props => [fullName, nationality];
}
