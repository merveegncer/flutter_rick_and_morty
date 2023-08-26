import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/character_model.dart';
import '../widgets/card_character.dart';

class GetAndShowCharacters extends StatefulWidget {
  const GetAndShowCharacters({super.key});

  @override
  State<GetAndShowCharacters> createState() => _GetAndShowCharacterState();
}

class _GetAndShowCharacterState extends State<GetAndShowCharacters> {
  TextEditingController textEditingController = TextEditingController();

  final Dio _dio = Dio();
  String _nextPageUrl = "https://rickandmortyapi.com/api/character/?page=1";
  String _previousPageUrl = "https://rickandmortyapi.com/api/character/?page=1";
  String _url = "https://rickandmortyapi.com/api/character/";
  String _filterName = "";
  String _filteredUrl = "";

  var gridcount = 2;

  List<CharacterModel> _characterList = [];

  Future<void> _getCharacters(String url) async {
    debugPrint('heyy');
    try {
      final response = await _dio.get(url);
      final data = response.data;
      debugPrint(url);

      if (response.statusCode == 200) {
        setState(() {
          _characterList = (data['results'] as List)
              .map((e) => CharacterModel.fromMap(e))
              .toList();
          _nextPageUrl = data['info']['next'] ??
              "https://rickandmortyapi.com/api/character/?page=42";
          _previousPageUrl = data['info']['prev'] ??
              '"https://rickandmortyapi.com/api/character/?page=1"';
        });
        debugPrint(url);
      } else {
        debugPrint('noo');
      }
    } on Dio catch (e) {
      debugPrint('Error fetching characters: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCharacters(_nextPageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: textEditingController,
          onSubmitted: (value) {
            setState(
              () {
                _filterName = _url + "?name=${textEditingController.text}";
              },
            );
            _getCharacters(_filterName);
          },
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
            onPressed: () => _getCharacters(_previousPageUrl ?? _nextPageUrl),
            child: const Text("Previous"),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
            onPressed: () => _getCharacters(_nextPageUrl),
            child: const Text("Next"),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/a6/66/0a/a6660a73483be1692daf7d44aafc21d3.jpg'))),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _filteredUrl = _filterName + "&status=alive";
                          });
                          _getCharacters(_filteredUrl);
                        },
                        child: Text("alive")),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _filteredUrl = _filterName + "&status=dead";
                          });
                          _getCharacters(_filteredUrl);
                        },
                        child: Text("dead")),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: characterFutureList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<CharacterModel>> characterFutureList() {
    return FutureBuilder<List<CharacterModel>>(
      future: Future.value(_characterList),
      builder: (context, snapshot) {
        var characterList = snapshot.data!;
        return GridView.builder(
          itemCount: characterList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            var this_character = characterList[index];
            return CharacterCard(character: this_character);
          },
        );
      },
    );
  }
}
