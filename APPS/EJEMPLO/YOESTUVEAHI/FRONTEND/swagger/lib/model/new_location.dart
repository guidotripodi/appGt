part of swagger.api;

class NewLocation {
  
  String name = null;

  String description = null;

  double maxCapacity = null;

  String address = null;

  String latitude = null;

  String longitude = null;

  String images = null;

  var imageFileBytes = null;

  NewLocation();

  @override
  String toString() {
    return 'NewLocation[name=$name, description=$description, maxCapacity=$maxCapacity, address=$address, latitude=$latitude, longitude=$longitude, images=$images, ]';
  }

  NewLocation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    maxCapacity = json['maxCapacity'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'maxCapacity': maxCapacity,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'images': images
     };
  }

  static List<NewLocation> listFromJson(List<dynamic> json) {
    return json == null ? new List<NewLocation>() : json.map((value) => new NewLocation.fromJson(value)).toList();
  }

  static Map<String, NewLocation> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, NewLocation>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new NewLocation.fromJson(value));
    }
    return map;
  }
}
