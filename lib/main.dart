import 'package:name_app/favorites.dart';
import "package:flutter/material.dart";
import "package:name_app/home.dart";

void main() {
  runApp(const NameApp());
}

class NameApp extends StatelessWidget {
  const NameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Name App",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 251, 64, 64)
        )
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/favorites": ((context) => const Favorites())
      },
    );
  }
}
