class TermsModel {
  TermsModel({
    required this.data,
  });

  late final Data data;

  TermsModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.terms,
  });

  late final String terms;

  Data.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
  }
}
