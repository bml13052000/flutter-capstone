// To parse this JSON data, do
//
//     final myResponse = myResponseFromJson(jsonString);

import 'dart:convert';

MyResponse myResponseFromJson(String str) => MyResponse.fromJson(json.decode(str));

String myResponseToJson(MyResponse data) => json.encode(data.toJson());

class MyResponse {
  MyResponse({
    required this.description,
    required this.title,
  });

  String description;
  String title;

  factory MyResponse.fromJson(Map<String, dynamic> json) => MyResponse(
    description: json["description"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "title": title,
  };
}
