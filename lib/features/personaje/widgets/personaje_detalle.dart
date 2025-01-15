import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/personaje_model.dart';

class PersonaDetalle extends StatelessWidget {
  const PersonaDetalle({
    super.key,
    required this.personaje,
  });

  final PersonajeModel personaje;

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
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
      height: 500,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              personaje.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: personaje.description.isEmpty ? Colors.transparent : const Color.fromARGB(154, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              personaje.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}