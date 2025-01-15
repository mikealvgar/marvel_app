import 'package:flutter/material.dart';
import '../../../data/models/personaje_model.dart';
import '../widgets/custom_sliverappbar.dart';
import '../widgets/personaje_detalle.dart';


class PersonajePage extends StatelessWidget {
  const PersonajePage({
    super.key,
    required this.personaje
  });

  final PersonajeModel personaje;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            CustomSliverAppBar(
              personaje: personaje,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => PersonaDetalle(personaje: personaje),
                childCount: 1
              ),
            )
          ],
        )
      ),
    );
  }
}