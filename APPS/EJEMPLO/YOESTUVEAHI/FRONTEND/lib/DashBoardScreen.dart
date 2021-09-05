import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'package:yoestuveahi/StyleUtils.dart';

class DashboardScreen extends StatelessWidget {
  final Statistics statistics;
  const DashboardScreen({Key key, @required this.statistics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
      body: IconTheme.merge(
        data: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(Icons.create, size: 1.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Datos al dia de: $now',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1.0),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.person,
                      text: '${statistics.nUsers} Usuarios Registrados',
                      /*
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(''),
                                  content: Text('Usuarios registrados: '),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Aceptar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ));
                      },*/
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.access_alarm,
                      text: '${statistics.nRisks} Potenciales Infectados',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                        icon: Icons.map_rounded,
                        text:
                            '${statistics.nLocations} Locaciones Registradas'),
                  ),
                  Expanded(
                    child: DashboardButton(
                        icon: Icons.coronavirus_sharp,
                        text: '${statistics.nInfections} Personas Infectadas'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  button(
                    text: 'Volver',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key key,
    @required this.icon,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.3,
              child: FittedBox(
                child: Icon(icon),
              ),
            ),
            SizedBox(height: 1.0),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Divider(height: 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
