// ignore_for_file: file_names

class GrammarDataDetail {
  int id;
  String text;
  GrammarDataDetail({required this.id,  required this.text});

  static List<GrammarDataDetail> init() {
    List<GrammarDataDetail> grammardatadetails = [
      GrammarDataDetail(
          id: 1,
          text:'Noun: Nouns are people, places, or things, They tell us what we are talking about. The words cat, Jack, rock, Africa, & it are nouns.' ),
      GrammarDataDetail(id: 2, 
      text: 'Adjectives: Adjectives modify, or describe, nouns. The words tall, beautiful, irresponsible, & boring are adjectives.'),
      GrammarDataDetail(id: 3, 
      text: 'Verbs & verb tenses: Verbs are action words. They tell us what is happening and when (past, present, future). Verbs can also express possibilities and conditions.'),
      GrammarDataDetail(id: 4, 
      text: 'Speech: When we report what someone says, we can cite the person directly or indirectly. Indirect speech rules are an important area of grammar.'),

    ];
    return grammardatadetails;
  }
}
