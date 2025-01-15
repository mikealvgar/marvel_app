import 'package:get/get.dart';
import 'package:marvel_app/core/network/api_marvel.dart';
import 'package:marvel_app/data/models/personajes_db_model.dart';
import '../models/personaje_model.dart';

class PersonajeProvider extends GetConnect{

  final ApiMarvel apiClient = ApiMarvel();
  Future<List<PersonajeModel>> getPersonajes(int offset, int limit) async {
    final response = await apiClient.getMethod('characters', offset: offset, limit: limit);
    final results = PersonajesDBModel.fromJson(response['data']);
    return results.results;
  }
}
