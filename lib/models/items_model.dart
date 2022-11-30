class ItemsModel {
  int? id;
  String? name;
  String? description;
  bool? isUnique;
  bool? isShadow;

  ItemsModel(
      {this.id, this.name, this.description, this.isUnique, this.isShadow});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isUnique = json['isUnique'];
    isShadow = json['isShadow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['isUnique'] = isUnique;
    data['isShadow'] = isShadow;
    return data;
  }
}