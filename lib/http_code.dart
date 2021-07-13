import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:httptest/http_response.dart';

Future<MyResponse> createPost(String title) async {

  final response = await http.Client().post(
    Uri.parse("http://baivabm13.pythonanywhere.com/wikisearch"),
    headers: <String,String>{
      'Content-Type':'application/json'
    },
    body: jsonEncode(<String,String>{
      'title':title
    })
  );
  // final response = await http.AltHttpClient().(
  //   "http://192.168.1.18",5000,"/wikisearch");

  if(response.statusCode==201){
    final String responseString = response.body;

    return myResponseFromJson(responseString);
  }

  else{
    throw Exception("Bad request");
  }

}

// class Post {
//   final String title;
//   final String desc;
//   final int id;
//
//   Post({required this.id, required this.title, required this.desc});
//
//   factory Post.fromJson(Map<String, dynamic> json){
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       desc: json['description']
//     );
//   }
//
// }

