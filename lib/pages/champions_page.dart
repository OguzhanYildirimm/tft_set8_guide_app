import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tft_set8_app/constants/project_colors.dart';
import 'package:tft_set8_app/constants/project_text_style.dart';
import 'package:tft_set8_app/models/champions_model.dart';
import 'package:tft_set8_app/models/traits_model.dart';

class ChampionsPage extends StatefulWidget {
  const ChampionsPage({super.key});

  @override
  State<ChampionsPage> createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  String BASE_IMAGE_TEXT = 'assets/images/champions/';
  List<ChampionsModel> championsList = <ChampionsModel>[];
  List<TraitsModel> traitsList = <TraitsModel>[];

  Future<void> loadLocalChampionsJson() async {
    String jsonString = await rootBundle.loadString('assets/json/champions.json');
    List<dynamic> jsonResponse = json.decode(jsonString).toList();
    championsList = jsonResponse.map((e) => ChampionsModel.fromJson(e)).toList();
    setState(() {
      championsList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocalChampionsJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors().russianViolet,
        title: Text(
          "Champions",
          style: ProjectTextStyle().titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: EdgeInsets.zero,
            itemCount: championsList.length,
            itemBuilder: ((context, index) {
              return _getChampionsCard(index);
            })),
      ),
    );
  }

  Card _getChampionsCard(int index) {
    return Card(
      elevation: 3.75,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
        child: Column(
          children: [
            _getChampionImageWidget(index),
            _customDiveder(),
            _getChampionsName(index),
            _customDiveder(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.5),
                  child: _getCoinImage(),
                ),
                _getChampionCost(index),
              ],
            ),
            _customDiveder(),
            //Text("${championsList[index].traits!.first},${championsList[index].traits!.last}", style: ProjectTextStyle().traitsTextStyle),
            _getChampionTraits(index),
          ],
        ),
      ),
    );
  }

  SizedBox _getChampionImageWidget(int index) {
    return SizedBox(
      width: 65,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: _getChampionsImage(index),
      ),
    );
  }

  Text _getChampionsName(int index) {
    return Text(
      championsList[index].name.toString(),
      style: ProjectTextStyle().mainTextStyle,
    );
  }

  Text _getChampionCost(int index) =>
      Text(championsList[index].cost.toString(), style: ProjectTextStyle().mainTextStyle);

  Text _getChampionTraits(int index) => Text(championsList[index].traits.toString(),
      textAlign: TextAlign.center, style: ProjectTextStyle().traitsTextStyle);

  Image _getChampionsImage(int index) => Image.asset('$BASE_IMAGE_TEXT${championsList[index].name.toString()}.jpg');

  Image _getCoinImage() {
    return Image.asset(
      'assets/images/dif/coin.png',
      width: 20,
    );
  }

	SizedBox _customDiveder() {
    return const SizedBox(
      height: 5,
    );
  }
}
