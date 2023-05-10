class Students {
  Students({
    required this.roll,
    required this.name,
    required this.college,
  });
  late final dynamic roll;
  late final String name;
  late final String college;

  Students.fromJson(Map<dynamic, dynamic> json) {
    roll = json['roll no.'];
    name = json['name'];
    college = json['college'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['roll no.'] = roll;
    _data['name'] = name;
    _data['college'] = college;
    return _data;
  }
}
