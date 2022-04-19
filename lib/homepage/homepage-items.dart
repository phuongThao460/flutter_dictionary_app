// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/card.dart';

class HomepageItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CardDetail> items = CardDetail.init();
    return GridView.builder(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return CardItems(card: items[index]);
          },
    );
  }
}

class CardItems extends StatelessWidget {
  final CardDetail card;
  CardItems({required this.card});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          card.img,
          fit: BoxFit.fill,
        ),
        Text(card.nameCard)
      ],
    );
  }
}
