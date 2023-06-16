class Item {
  final int roomId;
  final int buildingId;
  final String? buildingName;
  final String? doorNumber;
  final String? buildingAddress;
  final String? area;
  final int? rentalFee;
  final String? totalRent;
  final String? wallHeight;
  final String? floor;
  final String? blockName;
  final String? ownerRegister;
  final String? ownerName;
  final String? ownerLastname;
  final String? ownerImg;
  final String? ownerEmail;
  final String? ownerPhone;

  Item({
    required this.roomId,
    required this.buildingId,
    required this.buildingName,
    required this.doorNumber,
    required this.buildingAddress,
    required this.area,
    required this.rentalFee,
    required this.totalRent,
    required this.wallHeight,
    required this.floor,
    required this.blockName,
    required this.ownerRegister,
    required this.ownerName,
    required this.ownerLastname,
    required this.ownerImg,
    required this.ownerEmail,
    required this.ownerPhone,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      roomId: json['room_id'],
      buildingId: json['building_id'],
      buildingName: json['building_name'],
      doorNumber: json['door_number'],
      buildingAddress: json['building_address'],
      area: json['area'],
      rentalFee: json['rental_fee'],
      totalRent: json['total_rent'],
      wallHeight: json['wall_height'],
      floor: json['floor'],
      blockName: json['block_name'],
      ownerRegister: json['owner_register'],
      ownerName: json['owner_name'],
      ownerLastname: json['owner_lastname'],
      ownerImg: json['owner_img'],
      ownerEmail: json['owner_email'],
      ownerPhone: json['owner_phone'],
    );
  }
}
