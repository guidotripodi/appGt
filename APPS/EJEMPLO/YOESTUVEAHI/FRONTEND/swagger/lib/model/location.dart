part of swagger.api;

class Location {
  
  String id = null;

  String name = null;

  String description = null;

  double maxCapacity = null;

  double occupation = null;

  String address = null;

  String latitude = null;

  String longitude = null;

  List<String> images = [];

  Location();

  @override
  String toString() {
    return 'Location[id=$id, name=$name, description=$description, maxCapacity=$maxCapacity, occupation=$occupation, address=$address, latitude=$latitude, longitude=$longitude, images=$images, ]';
  }

  Location.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    maxCapacity = json['maxCapacity'];
    occupation = json['occupation'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    images = (json['images'] as List).map((item) => item as String).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'maxCapacity': maxCapacity,
      'occupation': occupation,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'images': images
     };
  }

  static List<Location> listFromJson(List<dynamic> json) {
    return json == null ? new List<Location>() : json.map((value) => new Location.fromJson(value)).toList();
  }

  static Map<String, Location> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Location>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Location.fromJson(value));
    }
    return map;
  }
}
