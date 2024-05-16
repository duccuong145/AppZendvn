import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search ',
          border: OutlineInputBorder(),
          prefixIcon: Icon(CupertinoIcons.search),
          fillColor: Colors.grey,
        ),
      ),
    );
  }
}
