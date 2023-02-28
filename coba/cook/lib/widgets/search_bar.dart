import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10, left: 20 * 2, right: 20 * 2),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'search_page');
        },
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.indigo[50],
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.search_rounded,
                  color: Colors.grey[500],
                  size: 40,
                ),
                Text(
                  "Search Recipes",
                  style: TextStyle(color: Colors.grey[500], fontSize: 23),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
