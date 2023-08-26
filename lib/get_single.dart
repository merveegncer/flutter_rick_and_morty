import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';
import 'package:rick_and_morty/screens/detail_episode_page.dart';

class GetSingle extends StatefulWidget {
  const GetSingle({
    super.key,
  });

  @override
  State<GetSingle> createState() => _GetSingleState();
}

class _GetSingleState extends State<GetSingle> {
  late Episode singleEpisode;

  Future<Episode> getsingleEpisode() async {
    final response =
        await Dio().get('https://rickandmortyapi.com/api/episode/24');

    if (response.statusCode == 200) {
      var episode = Episode.fromMap(response.data);

      setState(() {
        singleEpisode = episode;
      });
      debugPrint(episode.name);
    } else {
      debugPrint('hata' + response.statusMessage.toString());
    }
    return singleEpisode;
  }

  @override
  Widget build(BuildContext context) {
    var thisEpisode = getsingleEpisode();
    return Scaffold();
  }
}
