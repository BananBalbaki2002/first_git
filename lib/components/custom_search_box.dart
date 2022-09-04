
import 'package:flutter/material.dart';
import 'package:tasko/my_app/constants.dart';

class SearchBox extends StatelessWidget {
  var onChanded;
  SearchBox({this.onChanded});

  @override
  Widget build(BuildContext context) {
    return

      Container(
        margin: EdgeInsets.all(kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20)),
        child:


        TextField(
          onChanged: onChanded,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.white),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white)),
        ));
  }
}