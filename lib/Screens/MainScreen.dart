import 'package:flutter/material.dart';
import 'package:practicalogin/Screens/favoritos.dart';
import 'package:practicalogin/Screens/friends.dart';
import 'package:practicalogin/Screens/inicio.dart';
import 'package:practicalogin/Screens/settings.dart';
import 'package:practicalogin/Views/community_view.dart';
import 'package:practicalogin/Views/curso_view.dart';
import 'package:practicalogin/Vistas/notes.dart';
import 'package:practicalogin/login/login.dart';

class MainScreen extends StatefulWidget {
  final String usernameDetail;

  const MainScreen({super.key, required this.usernameDetail});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final screens = [const CommunityView(), const CursoView()];
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/drawerbg.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Image.asset("lib/assets/user.png"),
                    ),
                    Text(
                      "Bienvenido, ${widget.usernameDetail}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Mi inicio'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MiInicio()));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favoritos'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favoritos()));
                },
              ),
              ListTile(
                leading: Icon(Icons.note),
                title: Text('Notas'),
                onTap: () {
                  // Acción al hacer tap en Notas
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notes()));
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Mis amigos'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Amigos()));

                },
              ),
              Divider(), // Separador
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar sesión'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("¿Cerrar sesión?"),
                        content:
                            Text("¿Estás seguro de que deseas cerrar sesión?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text('Cerrar sesión'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text("N E O S E Ñ A S",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Settings()));
              },
              icon: Icon(
                Icons.settings,
                size: 32,
              ))
        ],
        centerTitle: true,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (indexValue) {
          setState(() {
            selectedIndex = indexValue;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.public_outlined),
            activeIcon: const Icon(Icons.public),
            label: "Comunidad",
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.class_outlined),
            activeIcon: const Icon(Icons.class_),
            label: "Curso",
            backgroundColor: colors.tertiary,
          ),
        ],
      ),
    );
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 50.0;
    Path path = Path();
    path.lineTo(0, rect.height - radius);
    path.quadraticBezierTo(rect.width / 2, rect.height + 2 * radius, rect.width,
        rect.height - radius);
    path.lineTo(rect.width, 0);
    path.close();
    return path;
  }
}
