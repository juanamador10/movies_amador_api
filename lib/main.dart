import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_id_provider.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieID()),
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(MovieID),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies New App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
        },
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(color: Colors.deepPurple)));
  }
}
