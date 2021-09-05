import 'package:flutter/material.dart';

final titleTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

final subtitleTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

final subSubtitleTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

final textFieldHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final textFieldLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final textFieldBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final textFieldTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

class BackgroundFrame extends StatelessWidget {
  BackgroundFrame({Key key, this.child})
      : assert(child != null),
        super(key: key);
  final _scrollController = ScrollController();
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              child: Text('#YoEstuveAhí', style: titleTextStyle),
            )),
        Container(
            height: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                        controller: _scrollController, child: child))))
      ],
    );
  }
}

Widget textField(
    {name = 'Text Field',
    hint = 'Hint...',
    keyboardType = TextInputType.text,
    obscureText = false,
    controller,
    validator,
    icon = Icons.add,
    inputFormatters}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        name,
        style: textFieldLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: textFieldBoxDecorationStyle,
        height: 60.0,
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          style: textFieldTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            hintText: hint,
            hintStyle: textFieldHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget button({text = 'BUTTON', onPressed}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: onPressed,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Widget backButton(BuildContext context, {text = 'VOLVER'}) {
  return button(
      text: text,
      onPressed: () {
        Navigator.pop(context);
      });
}

void showAlertDialogOptions(BuildContext context,
    {msg = '',
    title = 'Alerta!',
    accept = 'Continuar',
    @required acceptAction,
    cancel = 'Cancelar'}) {
  Widget acceptButton = FlatButton(
      child: Text(accept),
      onPressed: () {
        Navigator.of(context).pop();
        acceptAction();
      });

  Widget cancelButton = FlatButton(
    child: Text(cancel),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(msg),
    actions: [cancelButton, acceptButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showAlertDialog(BuildContext context,
    {msg = '', title = 'Alerta!', accept = 'Aceptar'}) {
  Widget acceptButton = FlatButton(
    child: Text(accept),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(msg),
    actions: [acceptButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
