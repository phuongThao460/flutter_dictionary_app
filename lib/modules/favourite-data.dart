// ignore_for_file: file_names

class FavouriteDataDetail {
  int id;
  String text;
  FavouriteDataDetail({required this.id,  required this.text});

  static List<FavouriteDataDetail> init() {
    List<FavouriteDataDetail> favouritedatadetails = [
      FavouriteDataDetail(
          id: 1,
          text:'Noun: Nouns are people, places, or things, They tell us what we are talking about. The words cat, Jack, rock, Africa, & it are nouns.' ),
      FavouriteDataDetail(id: 2, 
      text: 'Adjectives: Adjectives modify, or describe, nouns. The words tall, beautiful, irresponsible, & boring are adjectives.'),
      

    ];
    return favouritedatadetails;
  }
}
