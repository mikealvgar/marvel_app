import 'package:flutter/material.dart';
import '../../../data/models/personaje_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.personaje,
  });

  final PersonajeModel personaje;

  @override
  Widget build(BuildContext context) {

    final size  = MediaQuery.of(context).size;

    return  SliverAppBar(
      stretch: true,
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.80,
      foregroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        centerTitle: false,
        title: Text(
          personaje.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            if(personaje.thumbnail.path.isEmpty)
              CircularProgressIndicator(),
            SizedBox.expand(
              child: Image.network(
                '${personaje.thumbnail.path}.${personaje.format}', 
                fit: BoxFit.fitHeight
              )
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xB4000000)
                    ],
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}