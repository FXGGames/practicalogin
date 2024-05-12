import 'package:flutter/material.dart';

class MiInicio extends StatefulWidget {
  const MiInicio({super.key});

  @override
  State<MiInicio> createState() => _MiInicioState();
}

class _MiInicioState extends State<MiInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Mi Inicio"),
      ),
      body: Center(
        child: Text("Mi Inicio"),
      ),
    );
  }
}
