import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/list_characters_page.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GetAndShowCharacters(),
    ),
  ));
}
