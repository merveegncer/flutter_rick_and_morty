import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/widgets/green_text.dart';
import 'package:expandable/expandable.dart';

class DetailPage extends StatefulWidget {
  final CharacterModel theCharacter;

  const DetailPage({Key? key, required this.theCharacter}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  late CharacterModel _character;

  @override
  void initState() {
    super.initState();
    _character = widget.theCharacter;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 13),
    );
    _controller.forward(); // Animasyonu başlat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 64, 64, 64),
            image: DecorationImage(
                scale: 0.1,
                repeat: ImageRepeat.repeatY,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                opacity: 0.5,
                image: NetworkImage(

                    //'https://cdn.discordapp.com/attachments/826375565984137266/1142438301006045305/1692448905034.png'
                    'https://media.discordapp.net/attachments/826375565984137266/1142772619179991080/dream_TradingCard_2.jpg?width=410&height=670'))),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(4, 0, 4, 10),
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)),
                  color: Color.fromARGB(149, 140, 181, 221),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "# ${_character.id}",
                      style: const TextStyle(
                          fontSize: 35,
                          fontFamily: "Chakra",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                blurRadius: 10,
                                color: Color.fromARGB(186, 24, 17, 93),
                                offset: Offset(3, 2))
                          ]),
                    ),
                    Expanded(child: SizedBox(width: 100)),
                    Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Chip(
                              label: Text(_character.status.name,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0))),
                            ),
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Chip(label: Text(_character.species.name)),
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: character_info()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                            width: 10,
                          ),
                          Container(
                              height: 210,
                              width: 210,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(200)),
                                child: Image.network(_character.image,
                                    fit: BoxFit.fill),
                              )),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.3).animate(_controller),
                        child: Container(
                            height: 250,
                            width: 250,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(200)),
                              child: Image.network(
                                  'https://cdn.discordapp.com/attachments/826375565984137266/1142454429375803522/1692452749666.png'),
                            )),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 300),
                          height: 120,
                          width: 120,
                          child: Image.network(
                              'https://cdn.discordapp.com/attachments/826375565984137266/1142860707923247204/1692549613815.png'),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container character_info() {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(255, 8, 54, 2),
                offset: Offset(1, 1),
                blurStyle: BlurStyle.outer)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color.fromARGB(149, 140, 181, 221)),
      height: 550,
      width: 410,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: GreenText(
                        text: _character.name,
                        size: 40.0,
                      )),
                  Container(
                    width: 118,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.topRight,
                    child: Chip(
                        avatar: const Icon(
                          Icons.female,
                          size: 22,
                        ),
                        side: BorderSide(
                            color: Color.fromARGB(60, 0, 0, 0), width: 2),
                        label: Text(_character.gender.name,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 253, 227, 255),
                                shadows: [
                                  Shadow(
                                      blurRadius: 6,
                                      color: Color.fromARGB(125, 0, 0, 0),
                                      offset: Offset(2, 2)),
                                  Shadow(
                                      blurRadius: 6,
                                      color: Color.fromARGB(121, 0, 0, 0),
                                      offset: Offset(1, 3))
                                ])),
                        backgroundColor:
                            (_character.gender.name.toString() == 'MALE')
                                ? Colors.blue
                                : const Color.fromARGB(255, 216, 11, 117)),
                  ),
                ],
              ),
            ),
            expansionwidget(_character),
          ],
        ),
      ),
    );
  }

  ListView liste() {
    return ListView.builder(
      itemCount: _character.toMap().length - 1,
      itemBuilder: (context, index) {
        return info_row(_character.toMap().keys.toList()[index + 1],
            _character.toMap().values.toList()[index + 1].toString());
      },
    );
  }

  Container info_row(String txt, String inf) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(9),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromARGB(170, 7, 28, 72),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Color.fromARGB(255, 8, 3, 69),
              offset: Offset(0, 0),
              blurStyle: BlurStyle.outer,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AutoSizeText(
              textAlign: TextAlign.start,
              maxLines: 2,
              style: const TextStyle(
                  shadows: [
                    Shadow(
                        blurRadius: 10,
                        color: Color.fromARGB(0, 3, 19, 57),
                        offset: Offset(-3, 0)),
                    Shadow(
                        blurRadius: 8,
                        color: Color.fromARGB(0, 7, 4, 59),
                        offset: Offset(-1, 1))
                  ],
                  fontSize: 30,
                  color: Color.fromARGB(255, 160, 104, 220),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Chakra'),
              "  ${txt} :",
            ),
          ),
          Expanded(
            flex: 2,
            child: AutoSizeText(
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                    shadows: [
                      Shadow(
                          blurRadius: 8,
                          color: Color.fromARGB(0, 7, 4, 59),
                          offset: Offset(-1, 1))
                    ],
                    fontFamily: 'Chakra',
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 255, 255)),
                inf),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ExpansionTile expansionwidget(CharacterModel character) {
    return ExpansionTile(
      title: Text('Header'),
      children: [
        getepisodes(character),
      ],
    );
  }

  ListView getepisodes(CharacterModel character) {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          NeverScrollableScrollPhysics(), // Bu, içerideki ListView'ın kaydırma işlevini devre dışı bırakır
      itemCount: character.episode.length,
      itemBuilder: (context, index) {
        return Center(child: ListTile(title: Text(character.episode[index])));
      },
    );
  }
}
