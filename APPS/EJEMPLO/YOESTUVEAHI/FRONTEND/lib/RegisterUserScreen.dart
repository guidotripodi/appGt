import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swagger/api.dart';
import 'package:yoestuveahi/Client.dart';
import 'ErrorScreen.dart';
import 'StyleUtils.dart';

class RegisterUserScreen extends StatefulWidget {
  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userTextController = new TextEditingController();
  final TextEditingController _emailTextController = new TextEditingController();
  final TextEditingController _passwordTextController = new TextEditingController();

  Widget _buildUserTextField() {
    return textField(
        name: 'Usuario',
        hint: 'Ingresa tu usuario',
        keyboardType: TextInputType.name,
        icon: Icons.account_circle,
        controller: _userTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo usuario vacío';
          }
          return null;
        });
  }

  Widget _buildEmailTextField() {
    return textField(
        name: 'Email',
        hint: 'Ingresa tu email',
        keyboardType: TextInputType.emailAddress,
        icon: Icons.email,
        controller: _emailTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo email vacío';
          }
          return null;
        });
  }

  Widget _buildPasswordTextField() {
    return textField(
        name: 'Contraseña',
        hint: 'Ingresa tu contraseña',
        obscureText: true,
        icon: Icons.lock,
        controller: _passwordTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo contraseña vacío';
          }
          return null;
        });
  }

  Widget _buildRegisterBtn() {
    return button(
        text: 'REGISTRAR',
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            NewUser newUser = NewUser();
            newUser.email = _emailTextController.text;
            newUser.password = _passwordTextController.text;
            try {
              await Client.getInstance().userApi.createUser(newUser);
              Navigator.pop(context);
            } catch (e) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(apiException: e)));
              print("Error: $e\n");
            }
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Registro', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildUserTextField(),
                    SizedBox(height: 30.0),
                    _buildEmailTextField(),
                    SizedBox(height: 30.0),
                    _buildPasswordTextField(),
                    SizedBox(height: 30.0),
                    _buildRegisterBtn(),
                    backButton(context)
                  ],
                ))));
  }
}
