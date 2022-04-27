// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/favourite-data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class FavouriteList extends StatelessWidget {
  static String routeName = "/favorites";
  @override
  Widget build(BuildContext context) {
    List<FavouriteDataDetail> favouritedatadetails = FavouriteDataDetail.init();
    return Scaffold(
      appBar: AppBar(
        title: const Align(child: Text("Favourite"),)
      ),
      body: ListView.builder(
          itemCount: favouritedatadetails.length,
          itemBuilder: (BuildContext context, int index) {
            FavouriteDataDetail idiomdatadetail = favouritedatadetails[index];
            return Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actions: const <Widget>[

                
              ],
              //tab phải
              secondaryActions:const <Widget> [
                IconSlideAction(
                  caption: 'Remove',
                  color: Color(0xFF9921E8),
                  icon: Icons.delete,
                  //onTap: () => _showSnackBar('Archive'),
                )
              ],
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                leading: const Icon(Icons.note),
                title:
                    Text(idiomdatadetail.text, style: const TextStyle(fontSize: 16)),
              ),
            );
          }),
    );
  }

  // The child of the Slidable is what the user sees when the
  // component is not dragge
}

  
