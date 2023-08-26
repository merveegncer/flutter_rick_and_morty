import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';

class DetailEpisode extends StatelessWidget {
  final Episode thisepisode;
  const DetailEpisode({super.key, required this.thisepisode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(thisepisode.name),
            Text(thisepisode.url),
            Text(thisepisode.created.timeZoneName),
            Text(thisepisode.episode),
            Row(children: [
              SingleChildScrollView(
                physics: FixedExtentScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      color: Colors.black,
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
            ]),
            Text(thisepisode.id.toString()),
          ],
        ),
      ),
    );
  }
}
