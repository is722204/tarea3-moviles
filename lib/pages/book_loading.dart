import 'package:flutter/material.dart';

class BookLoading extends StatelessWidget {
  const BookLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 200,
              
              child: const Image(image: AssetImage('assets/content.jpg'),fit: BoxFit.fill,)
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Cargando",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            )
          ],
        ),
    );
  }
}