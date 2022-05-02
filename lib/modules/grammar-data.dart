// ignore_for_file: file_names, unnecessary_new

class Grammar {
  int id;
  String title;
  String structure;
  String define;
  String examples;
  
  Grammar(
      {required this.id,
      required this.title,
      required this.structure,
      required this.define,
      required this.examples});

  factory Grammar.fromJson(Map<String, dynamic> res) {
    return new Grammar(
        id: res['id'],
        title: res['title'],
        structure: res['structure'],
        define: res['define'],
        examples: res['examples']);
  }
}
