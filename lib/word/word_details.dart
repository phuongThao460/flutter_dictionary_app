// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class WordDetails extends StatefulWidget {
  static String routeName = '/word';

  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      const Tab(text: 'Eng - Viet'),
      const Tab(text: 'Eng - Eng'),
      const Tab(text: 'Grammar'),
      const Tab(text: 'Synonym'),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 5,
          title: const Text(
            'acknowledge',
            style: TextStyle(fontSize: 23.1, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
            )
          ],
          flexibleSpace: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5F72BE), Color(0xFF9921E8)])),
          ),
          bottom: TabBar(
            tabs: myTabs,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xFFDCAEFA),
            labelColor: const Color(0xFFFFFFFF),
            indicatorColor: const Color(0xFFDCAEFA),
            indicatorWeight: 5,
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.infinity,
            child: TabBarView(children: [
              _buildTab1(),
              const Text('this is tab 2'),
              const Text('this is tab 3'),
              const Text('this is tab 4'),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildTab1() {
    var dataHtml =
        '<h1>﻿a</h1><h3><i>/ei, ə/</i></h3><h2>danh từ,  số nhiều as,  </h2><ul><li>(thông tục) loại a, hạng nhất, hạng tốt nhất hạng rất tốt<ul style="list-style-type:circle"><li>his health is a:<i> sức khoẻ anh ta vào loại a</i></li></ul></li><li>(âm nhạc) la<ul style="list-style-type:circle"><li>a sharp:<i> la thăng</i></li><li>a flat:<i> la giáng</i></li></ul></li><li>người giả định thứ nhất; trường hợp giả định thứ nhất<ul style="list-style-type:circle"><li>from a to z:<i> từ đầu đến đuôi, tường tận</i></li><li>not to know a from b:<i> không biết tí gì cả; một chữ bẻ đôi cũng không biết</i></li></ul></li></ul><h2>mạo từ</h2><ul><li>một; một (như kiểu); một (nào đó)<ul style="list-style-type:circle"><li>a very cold day:<i> một ngày rất lạnh</i></li><li>a dozen:<i> một tá</i></li><li>a few:<i> một ít</i></li><li>all of a size:<i> tất cả cùng một cỡ</i></li><li>a Shakespeare:<i> một (văn hào như kiểu) Sếch-xpia</i></li><li>a Mr Nam:<i> một ông Nam (nào đó)</i></li></ul></li><li>cái, con, chiếc, cuốn, người, đứa...;<ul style="list-style-type:circle"><li>a cup:<i> cái chén</i></li><li>a knife:<i> con dao</i></li><li>a son of the Party:<i> người con của Đảng</i></li><li>a Vietnamese grammar:<i> cuốn ngữ pháp Việt Nam</i></li></ul></li></ul><h2>giới từ</h2><ul><li>mỗi, mỗi một<ul style="list-style-type:circle"><li>twice a week:<i> mỗi tuần hai lần</i></li></ul></li></ul>';
    return SingleChildScrollView(
      child: Html(data: dataHtml),
    );
  }
}
