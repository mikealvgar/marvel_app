class PersonajeModel {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;
  final String format;

  PersonajeModel({required this.id, required this.name, required this.description, required this.thumbnail, required this.format});

  factory PersonajeModel.fromJson(Map<String, dynamic> json) {

    return PersonajeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? 'Sin descripción',
      thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      format: json['thumbnail']['extension']
    );
  }

  PersonajeModel toEntity() {
    return PersonajeModel(
      id: id,
      name: name,
      description: description,
      thumbnail: thumbnail,
      format: format,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "format": format
    };
}

class Thumbnail {
  final String path;
  final String format;

  Thumbnail({required this.path, required this.format});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {

    return Thumbnail(
      path: json['path'],
      format: json['extension']
    );
  }

  Thumbnail toEntity() {
    return Thumbnail(
      path: path,
      format: format,
    );
  }

  Map<String, dynamic> toJson() => {
      "path": path,
      "extension": format
    };
}