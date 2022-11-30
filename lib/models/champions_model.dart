class ChampionsModel {
  String? name;
  String? championId;
  int? cost;
  List<String>? traits;

  ChampionsModel({this.name, this.championId, this.cost, this.traits});

  ChampionsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    championId = json['championId'];
    cost = json['cost'];
    traits = json['traits'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['championId'] = championId;
    data['cost'] = cost;
    data['traits'] = traits;
    return data;
  }
}