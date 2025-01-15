import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvel_app/data/models/personaje_model.dart';

import '../../../data/provider/personaje_provider.dart';

class PersonajeController extends GetxController {
  
  List<PersonajeModel> personajes = <PersonajeModel>[].obs;
  List<PersonajeModel> filterPersonajes = <PersonajeModel>[].obs;
  final GetStorage storage = GetStorage();
  final personajesProvider = Get.find<PersonajeProvider>();
  var isLoading = false.obs;
  var offset = 0.obs;
  var limit = 20.obs;

  @override
  void onInit() {
    super.onInit();
    storage.erase();
    _loadCharactersFromStorage() ;
  }

  PersonajeController(){
    getPersoanjes();
  }

  // Método para obtener los personajes llamando a PersonajeProvider
  Future<void> getPersoanjes() async {
    isLoading.value = true;
    final personajesLoad = await personajesProvider.getPersonajes(offset.value, limit.value);
    personajes.addAll(personajesLoad);
    filterPersonajes.assignAll(personajes);
    offset.value += 10;
    limit.value = 10;
    isLoading.value = false;
    _saveCharactersToStorage();
    update();
  }

  // Método para la busqueda de personaje por nombre
  void searchCharacters(String nombre) {
    if (nombre.isEmpty) {
      filterPersonajes.assignAll(personajes);
      update();
    } else {
      filterPersonajes.assignAll(
        personajes.where((character) => character.name.toLowerCase().contains(nombre.toLowerCase())).toList()
      );
      update();
    }}

  // Guardar la lista de personajes localmente usando GetStorage
  void _saveCharactersToStorage() {
    final personajesList = personajes
        .map((personajes) => personajes.toJson())
        .toList();
    storage.write('personajes', personajesList);
  }

  /// Cargar la lista de personajes desde almacenamiento local
  void _loadCharactersFromStorage() {
    final personajesList = storage.read<List<dynamic>>('personajes');
    if (personajesList != null) {
      personajes.assignAll(
        personajesList.map((item) => PersonajeModel.fromJson(item)).toList(),
      );
      filterPersonajes.assignAll(personajes);
    }
  }
  }

