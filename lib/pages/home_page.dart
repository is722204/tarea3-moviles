
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/pages/book.dart';
import 'package:tarea3/pages/book_loading.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tarea3/provider/books_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    var txtbook = TextEditingController();
    txtbook.text=context.watch<BooksProvider>().getSearched;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Librería free to play'),
          
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onSubmitted: ((value) {
                  context.read<BooksProvider>().search(value);
                }),
                controller: txtbook,
                decoration: InputDecoration(
                  labelText: 'Ingresa título',
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: (){
                      context.read<BooksProvider>().search(txtbook.text);
                    },
                    icon: const Icon(Icons.search,color: Colors.black,),
                    )
                
                ),
              ),
            ),
            Expanded(
            child: context.watch<BooksProvider>().isSearching?loading():context.watch<BooksProvider>().getBooks.isEmpty? empty(context):resultados(context),
            )
            
          ],
        ));
  }

  SizedBox loading() {
    return SizedBox(
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.57,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Shimmer.fromColors(
                    baseColor: Color.fromARGB(96, 219, 218, 218),
                    highlightColor: Color.fromARGB(255, 236, 236, 236),
                    child: const BookLoading());
              },
            ),
          );
  }

  GridView resultados(BuildContext context) {
    return GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.57,
              ),
              itemCount: context.watch<BooksProvider>().getBooks.length ,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(child: Book(book:context.read<BooksProvider>().getBooks[index]));
              },
            );
  }

  Center empty(BuildContext context) {
    return Center(
              child: Text(context.watch<BooksProvider>().getStatus),
            );
  }
}






            