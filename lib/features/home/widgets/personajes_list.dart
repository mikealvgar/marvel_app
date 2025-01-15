import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/features/personaje/controller/personaje_controller.dart';
import '../../../data/models/personaje_model.dart';
import 'personaje_item.dart';

class PersonajesList extends StatefulWidget {
  const PersonajesList({
    super.key,
    required this.personajes,
  });
  final List<PersonajeModel> personajes;

  @override
  State<PersonajesList> createState() => _PersonajesListState();
}

class _PersonajesListState extends State<PersonajesList> {
  var scrollController = ScrollController();
  final PersonajeController controller = Get.put(PersonajeController());
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }
  @override
  Widget build(BuildContext context) {
  
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: widget.personajes.length,
          itemBuilder: ( context, i) => PersonajeItem(personaje: widget.personajes[i])
        )
      ),
    );
  }

  //Se utiliza para cargar más personajes
  void _scrollListener(){
    if (controller.isLoading.value == false && controller.personajes.length >= 20 &&  scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        controller.getPersoanjes();
    }
  }
}