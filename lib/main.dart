import 'package:flutter/material.dart';
import './screens/tasks_list.dart';

void main() => runApp(BodyScreens());

class BodyScreens extends StatefulWidget {
  @override
  State<BodyScreens> createState() => _bodyScreensState();
}

int paginaActual = 0;

class _bodyScreensState extends State<BodyScreens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: PageView(
            children: [
              paginaActual == 0
                  ? PantallasP(color: Colors.blueGrey)
                  : paginaActual == 1
                      ? PantallasP(color: Colors.deepPurple)
                      : PantallasP(color: Colors.redAccent),
            ],
          ),

          /**Vista principal */
          bottomNavigationBar: BottomNavigationBar(
            //Indice necesario para activar las pantallas
            currentIndex: paginaActual,

            onTap: (index) {
              paginaActual = index;
              //State necesario para establecer la interaccion
              setState(() {});
            },

            backgroundColor: Colors.deepOrangeAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.3),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_task_sharp), label: 'Niños Tareas Casa'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_sharp,
                  ),
                  label: 'Materiales Escolares'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_view_day,
                  ),
                  label: 'Horario')
            ],
          )),
    );
  }
}

class PantallasP extends StatelessWidget {
  final Color color;

  const PantallasP({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: paginaActual == 0
          ? TaskList()
          : paginaActual == 1
              ? Materiales()
              : Horarios(),
    );
  }
}

class Tareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Aqui va la lista de Tareas'));
  }
}

class Materiales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Aqui va la lista de mateirales'));
  }
}

class Horarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Aqui va la lista de horarios'));
  }
}
//Metodo de cambio de pantalla con operadores ternarios
/** * body: paginaActual = 0 
          ?  PantallasP(color: Colors.blueGrey)
             : paginaActual == 1
             ? PantallasP(color: Colors.deepPurple) 
             : PantallasP(color: Colors.redAccent),*/