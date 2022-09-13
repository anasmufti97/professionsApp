/// id : 1
/// name : "Food Preservation, Packing and Logistics"
/// professionals : null

class Homescreendata {
  Homescreendata({
      int? id, 
      String? name, 
      dynamic professionals,}){
    _id = id;
    _name = name;
    _professionals = professionals;
}

  Homescreendata.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _professionals = json['professionals'];
  }
  int? _id;
  String? _name;
  dynamic _professionals;
Homescreendata copyWith({  int? id,
  String? name,
  dynamic professionals,
}) => Homescreendata(  id: id ?? _id,
  name: name ?? _name,
  professionals: professionals ?? _professionals,
);
  int? get id => _id;
  String? get name => _name;
  dynamic get professionals => _professionals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['professionals'] = _professionals;
    return map;
  }

}