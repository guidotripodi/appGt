part of swagger.api;

class History {
  
  String date = null;

  double nInfections = null;

  History();

  @override
  String toString() {
    return 'History[date=$date, nInfections=$nInfections, ]';
  }

  History.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    date = json['date'];
    nInfections = json['nInfections'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'nInfections': nInfections
     };
  }

  static List<History> listFromJson(List<dynamic> json) {
    return json == null ? new List<History>() : json.map((value) => new History.fromJson(value)).toList();
  }

  static Map<String, History> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, History>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new History.fromJson(value));
    }
    return map;
  }
}
