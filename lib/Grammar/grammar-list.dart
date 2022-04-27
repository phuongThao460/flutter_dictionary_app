// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/modules/grammar-data.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

class GrammarList extends StatelessWidget {
  static String routeName = "/grammar";
  @override
  Widget build(BuildContext context) {
    List<GrammarDataDetail> grammardatadetails = GrammarDataDetail.init();
    return Scaffold(
      appBar: AppBar(
        title: const Align(child: Text("Grammar"),)
        
      ),
      body: ListView.builder( 
          itemCount: grammardatadetails.length,
          itemBuilder: (BuildContext context, int index) {
           GrammarDataDetail grammardatadetail = grammardatadetails[index];
           
            return  ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

                    //nhap code add favourite tai day
                leading: IconButton(icon:const Icon(Icons.star_border), onPressed: () { /* Your code */ },),
                title:
                    Text(grammardatadetail.text, style: const TextStyle(fontSize: 16)),
              
          
      
            );
          }),
    );
  }


  // The child of the Slidable is what the user sees when the
  // component is not dragge
}
