import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_example/repository/library_repository.dart';
import 'package:library_example/ui/home/bloc/home_bloc.dart';
import 'package:library_example/ui/home/page/home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LibraryRepository(),
      child: BlocProvider(
        create: (context) => HomeBloc(
          repository: context.read<LibraryRepository>(),
        )..add(GetBookCatalog()),
        child: const HomeLayout(),
      ),
    );
  }
}
