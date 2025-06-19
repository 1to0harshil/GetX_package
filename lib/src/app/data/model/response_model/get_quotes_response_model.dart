class GetQuotesResponseModel {
  late final List<Quotes> quotes;
  late final int? total;
  late final int? skip;
  late final int? limit;

  GetQuotesResponseModel(
      {required this.quotes,
      required this.total,
      required this.skip,
      required this.limit});

  GetQuotesResponseModel.fromJson(Map<String, dynamic> json) {
    // if (json['quotes'] != null) {
    //   quotes = <Quotes>[];
    //   json['quotes'].forEach((v) {
    //     quotes!.add(new Quotes.fromJson(v));
    //   });
    // }
    quotes = List.from(json['quotes']).map((e) => Quotes.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.quotes != null) {
    //   data['quotes'] = this.quotes!.map((v) => v.toJson()).toList();
    // }
    final data = <String, dynamic>{};
    data['quotes'] = quotes.map((e) => e.toJson()).toList();
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Quotes {
  int? id;
  String? quote;
  String? author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['quote'] = quote;
    data['author'] = author;
    return data;
  }
}
