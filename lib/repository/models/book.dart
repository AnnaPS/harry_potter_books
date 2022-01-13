import 'package:equatable/equatable.dart';
import 'package:library_example/repository/models/author.dart';

class Book extends Equatable {
  const Book({
    required this.title,
    required this.author,
    required this.year,
    required this.image,
    required this.summary,
  });

  final String title;
  final Author author;
  final int year;
  final String image;
  final String summary;

  @override
  List<Object?> get props => [
        title,
        author,
        year,
        image,
        summary,
      ];
}
