class CardDetail {
  int id;
  String nameCard;
  String img;
  CardDetail({required this.id, required this.nameCard, required this.img});

  static List<CardDetail> init() {
    List<CardDetail> data = [
      CardDetail(id: 1, nameCard: 'Viet - Eng Dictionary', img: 'assets/images/cat-book.png'),
      CardDetail(id: 2, nameCard: 'Translate Text', img: 'assets/images/cat-book.png'),
      CardDetail(id: 3, nameCard: 'Vocabulary', img: 'assets/images/cat-book.png'),
      CardDetail(id: 4, nameCard: 'Favorite Words', img: 'assets/images/cat-book.png'),
      CardDetail(id: 5, nameCard: 'Short Story', img: 'assets/images/cat-book.png'),
      CardDetail(id: 6, nameCard: 'Idioms', img: 'assets/images/cat-book.png'),
      CardDetail(id: 7, nameCard: 'Conversations', img: 'assets/images/cat-book.png'),
      CardDetail(id: 8, nameCard: 'Grammar', img: 'assets/images/cat-book.png'),
      
    ];
    return data;
  }
}
