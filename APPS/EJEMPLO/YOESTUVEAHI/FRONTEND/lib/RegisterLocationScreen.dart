import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swagger/api.dart';
import 'package:yoestuveahi/ErrorScreen.dart';
import 'Client.dart';
import 'LocationQRScreen.dart';
import 'PickLocationScreen.dart';
import 'StyleUtils.dart';

class RegisterLocationScreen extends StatefulWidget {
  @override
  _RegisterLocationScreenState createState() => _RegisterLocationScreenState();
}

class _RegisterLocationScreenState extends State<RegisterLocationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _capacityTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();
  LatLng _position;
  Uint8List imageFileBytes;
  String imageFileName;


  Widget _buildNameTextField() {
    return textField(
        name: 'Nombre',
        hint: 'Ingresa un nombre',
        icon: Icons.map,
        controller: _nameTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo nombre vacío';
          }
          return null;
        });
  }

  Widget _buildAddressTextField() {
    return textField(
        name: 'Dirección',
        hint: 'Ingresa una dirección',
        icon: Icons.apartment,
        controller: _addressTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo dirección vacío';
          }
          return null;
        });
  }

  Widget _buildCapacityTextField() {
    return textField(
        name: 'Capacidad',
        hint: 'Ingresa la capacidad',
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        icon: Icons.home,
        controller: _capacityTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo capacidad vacío';
          }
          return null;
        });
  }


  Widget _buildDescriptionTextField() {
    return textField(
        name: 'Descripción',
        hint: 'Ingresa una descripción',
        icon: Icons.description,
        controller: _descriptionTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo descripción vacío';
          }
          return null;
        });
  }

  Widget _buildPickLocationBtn() {
    return button(
        text: 'ELEGIR UBICACIÓN',
        onPressed: () async {
          _position = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => PickLocationScreen()));
        });
  }

  void _selectFiles() {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.draggable = true;
    uploadInput.accept = 'image/*';
    uploadInput.click();
    document.body.append(uploadInput);
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new FileReader();
      reader.onLoadEnd.listen((e) {
        Uint8List _bytesData = Base64Decoder().convert(reader.result.toString().split(",").last);
        setState(() {
          imageFileBytes = _bytesData;
          imageFileName = file.name;
        });
      });
      reader.readAsDataUrl(file);
    });

    uploadInput.remove();
  }

  Widget _buildUploadImageBtn() {
    return button(
        text: 'SUBIR IMAGEN',
        onPressed: _selectFiles
    );
  }

  Widget _buildCreateBtn() {
    return button(
        text: 'CREAR',
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            if (_position == null) {
              showAlertDialog(context, msg: 'Elija una ubicación por favor.');
            } else {
              NewLocation newLocation = NewLocation();
              newLocation.name = _nameTextController.text;
              newLocation.address = _addressTextController.text;
              newLocation.description = _descriptionTextController.text;
              newLocation.imageFileBytes = imageFileBytes;
              newLocation.images = imageFileName;
              newLocation.maxCapacity = double.parse(_capacityTextController.text);
              newLocation.latitude = _position.latitude.toString();
              newLocation.longitude = _position.longitude.toString();
              print(newLocation);
              try {
                Location location = await Client.getInstance().locationApi.locationPost(newLocation);
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LocationQrScreen(locationId: location.id)));
                print(location);//FIXME: DEBUG
              } catch (e) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(apiException: e)));
                print("Error: $e\n");
              }

            }
          }
        });
  }

  Widget _buildBackBtn() {
    return backButton(context);
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
                    Text('Locación', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildNameTextField(),
                    SizedBox(height: 30.0),
                    _buildAddressTextField(),
                    SizedBox(height: 30.0),
                    _buildCapacityTextField(),
                    SizedBox(height: 30.0),
                    _buildDescriptionTextField(),
                    SizedBox(height: 30.0),
                    _buildPickLocationBtn(),
                    _buildUploadImageBtn(),
                    _buildCreateBtn(),
                    _buildBackBtn(),
                  ],
                ))));
  }
}
