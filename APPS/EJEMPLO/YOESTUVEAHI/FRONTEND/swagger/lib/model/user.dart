part of swagger.api;

class User {
  
  String email = null;

  bool isCheckedIn = null;

  bool isInfected = null;

  bool possiblyInfected = null;

  bool isAdmin = null;

  User();

  @override
  String toString() {
    return 'User[email=$email, isCheckedIn=$isCheckedIn, isInfected=$isInfected, possiblyInfected=$possiblyInfected, isAdmin=$isAdmin, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    isCheckedIn = json['isCheckedIn'];
    isInfected = json['isInfected'];
    possiblyInfected = json['possiblyInfected'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'isCheckedIn': isCheckedIn,
      'isInfected': isInfected,
      'possiblyInfected': possiblyInfected,
      'isAdmin': isAdmin
     };
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null ? new List<User>() : json.map((value) => new User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, User>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new User.fromJson(value));
    }
    return map;
  }
}
