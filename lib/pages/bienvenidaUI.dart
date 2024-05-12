import 'package:flutter/material.dart';
import 'package:practicalogin/data/contenido_UI.dart';
import 'package:practicalogin/login/login.dart';

//La clase bienvenida se encargara de mostrar la bienvenida a los nuevos usuarios
//Si el usuario ya esta registrado, no lo volvera a mostrar - Implementar en segunda instancia

class BienvenidaUI extends StatefulWidget {
  const BienvenidaUI({super.key});

  @override
  State<BienvenidaUI> createState() => _BienvenidaUIState();
}

class _BienvenidaUIState extends State<BienvenidaUI> {
  late PageController _controller;
  int currentIndex = 0;

  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("lib/assets/background_greeting.jpg"),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contenido.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.transparent, width: 2),
                              ),
                              child: Image.asset(
                                contenido[i].image,
                                fit: BoxFit
                                    .cover, // Ajusta la imagen para que cubra el contenedor
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              contenido[i].titulo,
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              contenido[i].descripcion,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  })),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contenido.length, (index) => buildPage(index, context)),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            height: 60,
            child: MaterialButton(
              onPressed: () async {
                if (currentIndex == contenido.length - 1) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                }
                _controller.nextPage(
                    duration: Duration(seconds: 1), curve: Curves.easeInOut);
              },
              color: Colors.indigoAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                  currentIndex == contenido.length - 1
                      ? "Empezar"
                      : "Siguiente",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ));
  }

  Container buildPage(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? Colors.blue
              : Colors.blue.withOpacity(0.2)),
    );
  }
}
