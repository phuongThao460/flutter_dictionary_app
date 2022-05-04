// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/Grammar/grammar-list.dart';
import 'package:flutter_dictionary_app/favouriteword/favourite-list.dart';
import 'package:flutter_dictionary_app/idiom/idiom-list.dart';
import 'package:flutter_dictionary_app/modules/card.dart';
import 'package:flutter_dictionary_app/translatetext/translate-text-page.dart';
import 'package:flutter_dictionary_app/translateVA/translate_va.dart';

class HomepageItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CardDetail> items = CardDetail.init();
    return GridView.builder(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 50),
      primary: false,
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (2 / 1.25),
        crossAxisSpacing: 15,
        mainAxisSpacing: 23,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.pushNamed(context, TranslateVA.routeName);
              } else if (index == 1) {
                Navigator.pushNamed(context, FavouriteList.routeName);
              } else if (index == 2) {
                //Navigator.pushNamed(context, routeName)
              } else if (index == 3) {
                Navigator.pushNamed(context, IdiomList.routeName);
              } else if (index == 4) {
                //Navigator.pushNamed(context, routeName)
              } else if (index == 5) {
                Navigator.pushNamed(context, GrammarList.routeName);
              }
            },
            child: CardItems(card: items[index]));
      },
    );
  }
}

class CardItems extends StatelessWidget {
  final CardDetail card;
  CardItems({required this.card});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: card.heightImg,
            width: card.widthImg,
            child: Image.asset(
              card.img,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            card.nameCard,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
