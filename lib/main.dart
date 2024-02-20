import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/domain/entities/movies.dart';
import 'Movies/presintaion/screens/movies_screen (1).dart';
import 'bloc_observes.dart';
import 'core/servecies/serveices_locator.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false ,
      home:MoviesScreen(),
    );
  }
}

