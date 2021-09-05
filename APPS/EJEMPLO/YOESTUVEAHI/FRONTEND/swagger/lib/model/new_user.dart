part of swagger.api;

class NewUser {
  
  String email = null;

  String password = null;

  NewUser();

  @override
  String toString() {
    return 'NewUser[email=$email, password=$password, ]';
  }

  NewUser.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
     };
  }

  static List<NewUser> listFromJson(List<dynamic> json) {
    return json == null ? new List<NewUser>() : json.map((value) => new NewUser.fromJson(value)).toList();
  }

  static Map<String, NewUser> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, NewUser>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new NewUser.fromJson(value));
    }
    return map;
  }
}
