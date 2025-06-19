class GetTodoResponseModel {
  late final List<Todos> todos;
  late final int? total;
  late final int? skip;
  late final int? limit;

  GetTodoResponseModel(
      {required this.todos,
      required this.total,
      required this.skip,
      required this.limit});

  GetTodoResponseModel.fromJson(Map<String, dynamic> json) {
    // if (json['todos'] != null) {
    //   todos = <Todos>[];
    //   json['todos'].forEach((v) {
    //     todos!.add(new Todos.fromJson(v));
    //   });
    // }
    todos = List.from(json['todos']).map((e) => Todos.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.todos != null) {
    //   data['todos'] = this.todos!.map((v) => v.toJson()).toList();
    // }
    final data = <String, dynamic>{};
    data['todos'] = todos.map((e) => e.toJson()).toList();
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Todos {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todos({this.id, this.todo, this.completed, this.userId});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
