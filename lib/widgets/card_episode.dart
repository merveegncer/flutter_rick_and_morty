import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';
import 'package:rick_and_morty/screens/detail_episode_page.dart';
import 'package:rick_and_morty/screens/list_characters_page.dart';

class EpisodeCard extends StatelessWidget {
  final Episode thisEpisode;
  const EpisodeCard({super.key, required this.thisEpisode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => DetailEpisode(
                  thisepisode: thisEpisode,
                )));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        color: Colors.pink.shade100,
        child: ListTile(
            title: Text(thisEpisode.name), subtitle: Text(thisEpisode.episode)),
      ),
    );
  }
}
