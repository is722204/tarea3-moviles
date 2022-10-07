import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/pages/details.dart';
import 'package:tarea3/provider/books_provider.dart';

class Book extends StatelessWidget {
  const Book({super.key, required this.book});
  final Map book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 200,
              
              child: Image.network("${book["volumeInfo"]["imageLinks"]["smallThumbnail"]}",fit: BoxFit.fill,)
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${book["volumeInfo"]["title"]}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold), textAlign: TextAlign.center,maxLines: 2,
            overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
        onTap: () {
          context.read<BooksProvider>().setShowCompleteFalse();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsBook(book: book)));
        },
      ),
    );
  }
}