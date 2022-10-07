import 'package:flutter/material.dart';
import 'package:tarea3/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/provider/books_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BooksProvider(), 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.grey[800]),
        primaryColor: Colors.black,
        
        
      ),
      title: 'Material App',
      home: const HomePage()
    );
  }
}