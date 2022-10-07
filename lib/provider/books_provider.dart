import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

// import 'package:record/record.dart';

class BooksProvider with ChangeNotifier {
  final List<dynamic> _books = [];
  String searched="";
  String worldCentered="Ingrese palabra para buscar libro";
  bool searching=false;
  bool complete=false;

  List<dynamic> get getBooks => _books;
  String get getSearched => searched;
  String get getStatus => worldCentered;
  bool get isSearching=>searching;
  bool get showComplete=>complete;

  setShowComplete(){
    complete=!complete;
    notifyListeners();
  }
  setShowCompleteFalse(){
    complete=false;
    notifyListeners();
  }

  setBooks(List<dynamic> books){
    // List <Map> booksCasted=books.cast<Map>();
    _books.clear();
    
    books.forEach((element) {
      try{
        if(element["volumeInfo"]["imageLinks"]["smallThumbnail"]!=null){
        };
        
      }catch (error){
        print("NO TIENE IMAGEN EL ${element["id"]}");
        element["volumeInfo"]["imageLinks"]={"smallThumbnail":"https://books.google.com.mx/googlebooks/images/no_cover_thumb.gif"};
        
      }
      _books.add(element);
    });
  notifyListeners();
  }

  search(String title)async{
    searching=true;
    notifyListeners();
    if(title.length<1){
      searching=false;
      worldCentered="Ingrese palabra para buscar libro";
      notifyListeners();
      return;
    }
    searched=title;
    var url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q=${title}&key=AIzaSyDSHcP94M4uzErwvU8HjzwjnnKliedzK8w');
    

    try{
      var response = await http.get(url);
    
    searching=false;
    notifyListeners();
      if(jsonDecode(response.body)["totalItems"]==0){
        worldCentered="No se encontraron libros con esa coincidencia";
      }
      if(jsonDecode(response.body)["items"]!=null){
        setBooks(jsonDecode(response.body)["items"] as List);
      }
      else{
        _books.clear();
        notifyListeners();
      }  
        }catch (e){
          searching=false;
          worldCentered="Revisa tu conexión a internet";
           _books.clear();
          notifyListeners();
        }  
      }
  }

  

