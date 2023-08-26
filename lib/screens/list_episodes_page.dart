import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/widgets/card_episode.dart';

import '../models/episode_model.dart';

class GetAndShowEpisodes extends StatefulWidget {
  const GetAndShowEpisodes({super.key});

  @override
  State<GetAndShowEpisodes> createState() => _GetAndShowEpisodesState();
}

class _GetAndShowEpisodesState extends State<GetAndShowEpisodes> {
  @override
  void initState() {
    _getEpisodes("https://rickandmortyapi.com/api/episode");
    super.initState();
  }

  List<Episode> _episodeList = [];

  Future<void> _getEpisodes(String url) async {
    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        setState(() {
          _episodeList = (response.data["results"] as List)
              .map((e) => Episode.fromMap(e))
              .toList();
        });
      } else
        debugPrint(response.statusMessage);
    } catch (e) {
      debugPrint('Error fetching episodes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<Episode>>(
          future: Future.value(_episodeList),
          builder: (context, snapshot) {
            var episodelist = snapshot.data!;

            return ListView.builder(
              itemCount: episodelist.length,
              itemBuilder: (context, index) {
                return EpisodeCard(thisEpisode: episodelist[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
