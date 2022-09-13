/// date : "2022-08-30T05:55:17.3706981-05:00"
/// temperatureC : -1
/// temperatureF : 31
/// summary : "Bracing"

class Weather {
  Weather({
      String? date, 
      int? temperatureC, 
      int? temperatureF, 
      String? summary,}){
    _date = date;
    _temperatureC = temperatureC;
    _temperatureF = temperatureF;
    _summary = summary;
}

  Weather.fromJson(dynamic json) {
    _date = json['date'];
    _temperatureC = json['temperatureC'];
    _temperatureF = json['temperatureF'];
    _summary = json['summary'];
  }
  String? _date;
  int? _temperatureC;
  int? _temperatureF;
  String? _summary;
Weather copyWith({  String? date,
  int? temperatureC,
  int? temperatureF,
  String? summary,
}) => Weather(  date: date ?? _date,
  temperatureC: temperatureC ?? _temperatureC,
  temperatureF: temperatureF ?? _temperatureF,
  summary: summary ?? _summary,
);
  String? get date => _date;
  int? get temperatureC => _temperatureC;
  int? get temperatureF => _temperatureF;
  String? get summary => _summary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['temperatureC'] = _temperatureC;
    map['temperatureF'] = _temperatureF;
    map['summary'] = _summary;
    return map;
  }

}