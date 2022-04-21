// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/card.dart';
import 'package:flutter_dictionary_app/word/word_details.dart';

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
                Navigator.pushNamed(context, WordDetails.routeName);
              } else if (index == 1){
                //Navigator.pushNamed(context, routeName)
              }else if (index == 2){
                //Navigator.pushNamed(context, routeName)
              }else if (index == 3){
                //Navigator.pushNamed(context, routeName)
              }else if (index == 4){
                //Navigator.pushNamed(context, routeName)
              }else if (index == 5){
                //Navigator.pushNamed(context, routeName)
              }else if (index == 6){
                //Navigator.pushNamed(context, routeName)
              }else if (index == 7){
                //Navigator.pushNamed(context, routeName)
              }
            },
            child: CardItems(card: items[index]));
      },
    );
  }
}

Widget buildButton({required String text, required VoidCallback onClicked}) =>
    ElevatedButton(onPressed: onClicked, child: Text(text));

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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              card.img,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 25,
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
