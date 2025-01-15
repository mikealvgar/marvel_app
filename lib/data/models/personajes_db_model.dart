
import 'personaje_model.dart';

class PersonajesDBModel {
    final int offset;
    final int limit;
    final int total;
    final int count;
    final List<PersonajeModel> results;

PersonajesDBModel({
        required this.offset,
        required this.limit,
        required this.total,
        required this.count,
        required this.results,
    });

    factory PersonajesDBModel.fromJson(Map<String, dynamic> json) => PersonajesDBModel(
        offset: json["offset"] ?? '',
        limit: json["limit"] ?? '',
        total: json["total"] ?? '',
        count: json["count"] ?? '',
        results: List<PersonajeModel>.from(json["results"].map((x) => PersonajeModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toEntity())),
    };
}
