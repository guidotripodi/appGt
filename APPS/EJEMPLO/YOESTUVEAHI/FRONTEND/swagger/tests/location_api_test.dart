import 'package:swagger/api.dart';
import 'package:test/test.dart';


/// tests for LocationApi
void main() {
  var instance = new LocationApi();

  group('tests for LocationApi', () {
    // Devuelve un listado de las locaciones del usuario / del sistema si el usuario es el admin
    //
    //Future<LocationList> locationGet() async
    test('test locationGet', () async {
      // TODO
    });

    // Devuelve una locacion en su estado actual
    //
    //Future<LocationList> locationLocationIdGet(String locationId) async
    test('test locationLocationIdGet', () async {
      // TODO
    });

    // Edita una locacion
    //
    //Future locationLocationIdPut(NewLocation body, String locationId) async
    test('test locationLocationIdPut', () async {
      // TODO
    });

    // Crea una locacion
    //
    // Da de alta una locacion
    //
    //Future<Location> locationPost(String name, String description, double maxCapacity, String address, String latitude, String longitude, String images) async
    test('test locationPost', () async {
      // TODO
    });

  });
}
