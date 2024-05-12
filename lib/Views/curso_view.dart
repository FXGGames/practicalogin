import 'package:flutter/material.dart';

class CursoView extends StatefulWidget {
  const CursoView({super.key});

  @override
  State<CursoView> createState() => _CursoViewState();
}

class _CursoViewState extends State<CursoView> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Curso de Señas LSC",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
      Card(
        child: ListTile(
          title: Text("Introducción"),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Introducción"),
                  content: Text("Bienvenido al curso de LSC, aqui aprenderas mucho acerca de la cultura sordomuda de Colombia!"),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text("Saludos"),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Saludos"),
                  content: Text("Los saludos son importantes en cualquier idioma, ¿porque no aprenderlos?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text("Horas del día"),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Horas del día"),
                  content: Text("¿Como se gestuan las horas del dia en el LSC?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),]
            ),
          );
  }
}
