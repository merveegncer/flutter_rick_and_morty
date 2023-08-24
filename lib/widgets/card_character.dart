import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

import '../screens/detail_character_page.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoModalPopupRoute(
          builder: (context) => DetailPage(
            theCharacter: character,
          ),
        ));
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(10, 8, 8, 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 3,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                Container(
                  child: Image.network(character.image),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: const Color.fromARGB(180, 82, 130, 143),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                ),
              ]),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                child: Text(character.name)),
            /*  Chip(
              labelStyle: TextStyle(fontSize: 12),
              label: Text(character.species.name),
            ), */
          ],
        ),
      ),
    );
  }
}
