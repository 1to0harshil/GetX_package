import 'package:flutter/material.dart';

class IntroDataModel {
  String? id;
  String? name;
  String? content;
  IconData? image;
  Color? backgroundColor;

  IntroDataModel({
    this.id,
    this.name,
    this.content,
    this.image,
    this.backgroundColor,
  });

  factory IntroDataModel.fromJson(Map<String, dynamic> json) => IntroDataModel(
        id: json['_id'],
        name: json['name'],
        content: json['content'],
        image: json['introDataImage'],
        backgroundColor: json['backgroundColor'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'content': content,
        'introDataImage': image,
        'backgroundColor': backgroundColor,
      };
}
