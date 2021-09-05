part of swagger.api;

class Statistics {
  
  double nUsers = null;

  double nLocations = null;

  double nInfections = null;

  double nRisks = null;

  Statistics();

  @override
  String toString() {
    return 'Statistics[nUsers=$nUsers, nLocations=$nLocations, nInfections=$nInfections, nRisks=$nRisks, ]';
  }

  Statistics.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    nUsers = json['nUsers'];
    nLocations = json['nLocations'];
    nInfections = json['nInfections'];
    nRisks = json['nRisks'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nUsers': nUsers,
      'nLocations': nLocations,
      'nInfections': nInfections,
      'nRisks': nRisks
     };
  }

  static List<Statistics> listFromJson(List<dynamic> json) {
    return json == null ? new List<Statistics>() : json.map((value) => new Statistics.fromJson(value)).toList();
  }

  static Map<String, Statistics> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Statistics>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Statistics.fromJson(value));
    }
    return map;
  }
}
