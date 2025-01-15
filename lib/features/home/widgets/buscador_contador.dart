import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/features/personaje/controller/personaje_controller.dart';
import '../../../core/utils/constants.dart';

class BuscadorContador extends StatelessWidget {
  const BuscadorContador({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PersonajeController controller = Get.put(PersonajeController());
    return GetBuilder<PersonajeController>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                IconButton(
                  splashRadius: 1,
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: Constants.colorPrimary
                  )
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      onChanged: (value) {
                        controller.searchCharacters(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Buscar personaje',
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 15, left: 10),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Constants.colorPrimary,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Constants.colorPrimary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    controller.personajes.length.toString(),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}