class RoomModel {
  int? roomId;
  int? buildingId;
  String? buildingName;
  String? doorNumber;
  String? buildingAddress;
  String? area;
  int? rentalFee;
  String? totalRent;
  String? wallHeight;
  String? floor;
  String? blockName;
  String? ownerRegister;
  String? ownerName;
  String? ownerLastname;
  String? ownerImg;
  String? ownerEmail;
  String? ownerPhone;

  RoomModel(
      {this.roomId,
      this.buildingId,
      this.buildingName,
      this.doorNumber,
      this.buildingAddress,
      this.area,
      this.rentalFee,
      this.totalRent,
      this.wallHeight,
      this.floor,
      this.blockName,
      this.ownerRegister,
      this.ownerName,
      this.ownerLastname,
      this.ownerImg,
      this.ownerEmail,
      this.ownerPhone});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    buildingId = json['building_id'];
    buildingName = json['building_name'];
    doorNumber = json['door_number'];
    buildingAddress = json['building_address'];
    area = json['area'];
    rentalFee = json['rental_fee'];
    totalRent = json['total_rent'];
    wallHeight = json['wall_height'];
    floor = json['floor'];
    blockName = json['block_name'];
    ownerRegister = json['owner_register'];
    ownerName = json['owner_name'];
    ownerLastname = json['owner_lastname'];
    ownerImg = json['owner_img'];
    ownerEmail = json['owner_email'];
    ownerPhone = json['owner_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['building_id'] = buildingId;
    data['building_name'] = buildingName;
    data['door_number'] = doorNumber;
    data['building_address'] = buildingAddress;
    data['area'] = area;
    data['rental_fee'] = rentalFee;
    data['total_rent'] = totalRent;
    data['wall_height'] = wallHeight;
    data['floor'] = floor;
    data['block_name'] = blockName;
    data['owner_register'] = ownerRegister;
    data['owner_name'] = ownerName;
    data['owner_lastname'] = ownerLastname;
    data['owner_img'] = ownerImg;
    data['owner_email'] = ownerEmail;
    data['owner_phone'] = ownerPhone;
    return data;
  }
}
