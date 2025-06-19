import 'dart:convert';

class GetCategoryListModel {
  List<String> getCategoryListModelFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));

  String getCategoryListModelToJson(List<String> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x)));
}
