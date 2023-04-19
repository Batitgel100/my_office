class RoomModel {
  int? id;
  String? number;
  int? levelId;

  int? buildingId;

  String? geometry;

  String? createdAt;
  String? updatedAt;
  int? type;
  bool? isPublicAdvert;

  RoomModel(
      {this.id,
      this.number,
      this.levelId,
      this.buildingId,
      this.geometry,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.isPublicAdvert});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    levelId = json['level_id'];

    buildingId = json['building_id'];

    geometry = json['geometry'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    isPublicAdvert = json['is_public_advert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['level_id'] = levelId;

    data['building_id'] = buildingId;

    data['geometry'] = geometry;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    data['is_public_advert'] = isPublicAdvert;
    return data;
  }
}
