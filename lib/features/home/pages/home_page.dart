import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/features/personaje/controller/personaje_controller.dart';
import '../../../core/utils/constants.dart';
import '../widgets/buscador_contador.dart';
import '../widgets/personajes_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put( PersonajeController() );
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text('Personajes de Marvel'),
      ),
      body: GetBuilder<PersonajeController>(
        builder: (state) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                BuscadorContador(),
                SizedBox(height: 20),
                if(state.isLoading.value)
                  Center(child: CircularProgressIndicator(color: Constants.colorPrimary,)),
                PersonajesList(personajes: state.filterPersonajes),
                SizedBox(height: 30),
              ],
            ),
          );
        }
      ),
    );
  }
}