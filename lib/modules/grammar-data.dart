// ignore_for_file: file_names, unnecessary_new

class GrammarDataDetail {
  int id;
  String title;
  String structure;
  String define;
  String examples;
  GrammarDataDetail({required this.id, required this.title, required this.structure, required this.define, required this.examples});

  factory GrammarDataDetail.fromJson(Map<String, dynamic> res) {
    return new GrammarDataDetail(
        id: res['id'],
        title: res['title'],
        structure: res['structure'],
        define: res['define'],
        examples: res['examples']
        );
  }
}
