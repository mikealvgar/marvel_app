import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/personaje_model.dart';
import '../../personaje/pages/personaje_page.dart';

class PersonajeItem extends StatelessWidget {
  const PersonajeItem({
    super.key,
    required this.personaje,
  });

  final PersonajeModel personaje;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(PersonajePage(personaje: personaje)),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: RadialGradient(
            center: Alignment(0.7, -0.6),
            radius: 1.5,
            colors: [
              Constants.colorPrimary,
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            stops: [0.3, 0.6, 1.0],
          ),
        ),
        padding: EdgeInsets.only(top: 10, left: 20, right: 5, bottom: 10),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                personaje.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Icon(
              Icons.arrow_right_outlined,
              size: 40,
              color: Colors.white38,
            )
          ],
        ),
      ),
    );
  }
}