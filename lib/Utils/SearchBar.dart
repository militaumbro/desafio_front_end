import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(4, 3),
            )
          ],
          color: Color.fromRGBO(17, 112, 99, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
            child: Container(
                // height: 40,
                // width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 247, 247, 1),
                  // borderRadius: BorderRadius.all(Radius.circular(10),),
                ),
                child: TextField()),
          ),
          IconButton(
              iconSize: 26,
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                // size: 30,
              ))
        ],
      ),
    );
  }
}
