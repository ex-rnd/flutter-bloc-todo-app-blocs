import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soulful/home.dart';
import 'package:soulful/todo_bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final docsDir = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(docsDir.path),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App / Bloc Pattern',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Colors.yellowAccent,
          onPrimary: Colors.black,
          secondary: Colors.lightGreen,
          onSecondary: Colors.white
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TodoBloc>
        (
          create: (context) => TodoBloc()..add(
              TodoStarted()
          ),
          child: const HomeScreen(),
        )
    );
  }
}