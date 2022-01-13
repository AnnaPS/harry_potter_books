import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_example/ui/detail/page/book_detail_page.dart';
import 'package:library_example/ui/home/bloc/home_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Library'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.status.isSuccess
              ? ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, index) {
                    var book = state.bookCatalog[index];
                    return ListTile(
                      key: ValueKey('BookTile$index'),
                      title: Text(book.title),
                      subtitle: Text(book.author.fullName),
                      leading: Hero(
                        tag: 'book${book.title}',
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            book.image,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BookDetailPage(book: book);
                            },
                          ),
                        );
                      },
                    );
                  },
                  itemCount: state.bookCatalog.length,
                )
              : state.status.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Center(
                      child: Text('No data'),
                    );
        },
      ),
    );
  }
}
