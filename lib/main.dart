import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_peliculas/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() => runApp(const AppState());

//* provider
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

//* MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/details': (_) => const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
            color: Colors.purple,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.purple),
          ),
          useMaterial3: true),
    );
  }
}
