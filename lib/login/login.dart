import 'package:flutter/material.dart';
import 'package:practicalogin/SQLite/Database.dart';
import 'package:practicalogin/Screens/MainScreen.dart';
import 'package:practicalogin/jsonModels/userModel.dart';
import 'package:practicalogin/login/registro.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isVisible = false;
  bool isLogged = false;
  final formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();

  login() async {
    var resultado =
        await db.login(Users(userName: username.text, userPass: password.text));
    if (resultado == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen(usernameDetail: username.text)),);
    } else {
        isLogged = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/bg_login.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Column(children: [
                //LoginImage
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "Neoseñas",
                        style: TextStyle(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      "lib/assets/login.png",
                      width: 180,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurpleAccent.withOpacity(0.3)),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Debe ingresar un nombre de usuario!";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.white60,
                        ),
                        border: InputBorder.none,
                        hintText: "Nombre de Usuario",
                        hintStyle: TextStyle(color: Colors.white60)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurpleAccent.withOpacity(0.3)),
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Debe ingresar la contraseña!";
                      }
                      return null;
                    },
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.white60,
                        ),
                        border: InputBorder.none,
                        hintText: "Contraseña",
                        hintStyle: const TextStyle(color: Colors.white60),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Colors.white60,
                        )),
                  ),
                ),

                //Boton de Login
                const SizedBox(height: 10),
                Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //No funciona con el login -- Arreglar luego
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen(usernameDetail : username.text)));
                          }
                        },
                        child: const Text("Iniciar Sesion",
                            style: TextStyle(color: Colors.white)))),

                //Boton de Registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No tienes una cuenta?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Registro()));
                      },
                      child: const Text(
                        "Registrate!",
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    )
                  ],
                ),
                isLogged ? const Text(
                        "Nombre de usuario o contraseña incorrectos!",
                        style: TextStyle(color: Colors.white60),
                      )
                    : SizedBox(height: 10)
              ]),
            )),
          ),
        ),
      ),
    );
  }
}
