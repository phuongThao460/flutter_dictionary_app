// ignore_for_file: unnecessary_new

class Dictionary {
  int id;
  String word;
  String html;
  String description;
  String pronounce;

  Dictionary(
      {required this.id,
      required this.word,
      required this.html,
      required this.description,
      required this.pronounce});

  factory Dictionary.fromJson(Map<String, dynamic> res) {
    return new Dictionary(
        id: res['id'],
        word: res['word'],
        html: res['html'],
        description: res['description'],
        pronounce: res['pronounce']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'html': html,
        'description': description,
        'pronounce': pronounce,
      };
}
