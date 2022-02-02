import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search results'),
      ),
      backgroundColor: Colors.red,
      body: Container(),
    );
  }
}
