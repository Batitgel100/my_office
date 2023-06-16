class Tool {
  int id;
  int toolType;
  int roomId;
  String name;
  int quantity;
  String description;
  int createdBy;
  DateTime createdAt;
  dynamic updatedBy;
  DateTime updatedAt;
  List<String> images;
  List<FileElement> files;

  Tool({
    required this.id,
    required this.toolType,
    required this.roomId,
    required this.name,
    required this.quantity,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedBy,
    required this.updatedAt,
    required this.images,
    required this.files,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    final List<String> imagesList = [];
    final List<FileElement> filesList = [];

    if (json['images'] != null) {
      for (final image in json['images']) {
        imagesList.add(image);
      }
    }

    if (json['files'] != null) {
      for (final file in json['files']) {
        final pivot = Pivot(
          toolId: file['pivot']['tool_id'],
          documentId: file['pivot']['document_id'],
        );
        filesList.add(
          FileElement(
            id: file['id'],
            type: file['type'],
            url: file['url'],
            createdBy: file['created_by'],
            createdAt: DateTime.parse(file['created_at']),
            name: file['name'],
            pivot: pivot,
          ),
        );
      }
    }

    return Tool(
      id: json['id'],
      toolType: json['tool_type'],
      roomId: json['room_id'],
      name: json['name'],
      quantity: json['quantity'],
      description: json['description'],
      createdBy: json['created_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedBy: json['updated_by'],
      updatedAt: DateTime.parse(json['updated_at']),
      images: imagesList,
      files: filesList,
    );
  }
}

class FileElement {
  int id;
  int type;
  String url;
  dynamic createdBy;
  DateTime createdAt;
  String name;
  Pivot pivot;

  FileElement({
    required this.id,
    required this.type,
    required this.url,
    required this.createdBy,
    required this.createdAt,
    required this.name,
    required this.pivot,
  });
}

class Pivot {
  int toolId;
  int documentId;

  Pivot({
    required this.toolId,
    required this.documentId,
  });
}
