class BaseModel<T> {
  int code;
  String message;
  dynamic data;

  BaseModel({
    required this.code,
    required this.message,
    this.data,
  });

  factory BaseModel.fromJson(
          Map<String, dynamic> json, Function(Map<String, dynamic>) create,) =>
      BaseModel(
        code: json['code'],
        message: json['message'],
        data: (json['data'] != null)
            ? (json['data'] is List)
                ? List<T>.from(json['data'].map((x) => create(x)))
                : create(json['data'])
            : null,
      );
}
