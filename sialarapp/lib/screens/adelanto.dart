import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/utilities/constants.dart';

void main() => runApp(MaterialApp(
      title: "Tutorial",
      home: adelanto(),
    ));

class adelanto extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<adelanto> {
  int _value = 1;

  @override
  Widget _buildArea(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Seleccione el area a la que desea realizar el adelanto',
          style: kLabelStyle,
        ),
        Center(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Servicio Tecnico"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Administracion"),
                      value: 2,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  })),
        )
      ],
    );
  }

  Widget _buildEnvioadelanto(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Detalle del adelanto',
            style: kLabelStyle,
          ),
          TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Ingrese su adelanto',
              hintStyle: kHintTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.

                // Si el formulario es válido, queremos mostrar un Snackbar
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              },
              child: Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMPLEADO"),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildArea(context),
                      _buildEnvioadelanto(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
