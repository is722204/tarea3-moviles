import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tarea3/provider/books_provider.dart';

class DetailsBook extends StatelessWidget {
  const DetailsBook({super.key, required this.book});
  final Map book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Detalles del libro'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.explore)),
            IconButton(onPressed: ()async{
              await Share.share("Libro: ${book["volumeInfo"]["title"]} \nPáginas: ${book["volumeInfo"]["pageCount"]}");
            }, icon: const Icon(Icons.share))
          ],
        ),
      body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network("${book["volumeInfo"]["imageLinks"]["smallThumbnail"]}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("${book["volumeInfo"]["title"]?? "-"}",style: const TextStyle(fontSize: 23),),
                  ),
                ],
              ),
            ),
            Text("${book["volumeInfo"]["publishedDate"]}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            Text("Páginas: ${book["volumeInfo"]["pageCount"] ?? "-"}",style: const TextStyle(fontSize: 16)),
            GestureDetector(
              child: Text("${book["volumeInfo"]["description"]?? "-"}",style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 16),overflow: TextOverflow.ellipsis,maxLines: context.watch<BooksProvider>().showComplete?500:4,),
              onTap: (){ context.read<BooksProvider>().setShowComplete();},
            )
          ],
        ),
      ),
    ));
  }
}
