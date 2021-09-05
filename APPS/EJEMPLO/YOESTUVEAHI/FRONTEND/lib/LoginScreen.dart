import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swagger/api.dart';
import 'Client.dart';
import 'ErrorScreen.dart';
import 'RegisterUserScreen.dart';
import 'StyleUtils.dart';
import 'UserScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController =
      new TextEditingController();
  final TextEditingController _passwordTextController =
      new TextEditingController();

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
        icon: Icons.lock,
        obscureText: true,
        controller: _passwordTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo password vacío';
          }
          return null;
        });
  }

  Widget _buildLoginBtn() {
    return button(
        text: 'INGRESA',
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            Client.getInstance()
                .setAuthorization(_emailTextController.text, _passwordTextController.text);
            try {
              User user = await Client.getInstance().userApi.getUser();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserScreen(user: user)));
            } catch (e) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ErrorScreen(apiException: e)));
              print("Error: $e\n");
            }
          }
        });
  }

  Widget _buildRegisterBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegisterUserScreen()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '¿No tenés cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
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
                    Text('Login', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildEmailTextField(),
                    SizedBox(height: 30.0),
                    _buildPasswordTextField(),
                    _buildLoginBtn(),
                    _buildRegisterBtn(),
                  ],
                ))));
  }
}
