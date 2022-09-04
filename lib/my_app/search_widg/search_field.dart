
import 'package:flutter/material.dart';

import '../constants.dart';

class SearchFiled extends StatelessWidget {


  const SearchFiled({
    required this.onChanged,
  }) ;

  final ValueChanged onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:kDefaultPadding/2,right:kDefaultPadding/2),
      padding:  EdgeInsets.symmetric(
        horizontal: kDefaultPadding,

      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.black45),
      //  cursorColor: Colors.w,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search,color: Colors.white,),
          hintText: 'Search',

        ),
      ),
    );
  }
}
