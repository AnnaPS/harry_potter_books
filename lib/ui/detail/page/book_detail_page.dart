import 'package:flutter/material.dart';
import 'package:library_example/repository/models/book.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'book${book.title}',
                child: Container(
                  height: 300.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        book.image,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                book.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16.0),
              Text(
                ' ${book.author.fullName} - ${book.year}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Description',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 16.0),
              Text(
                book.summary,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
