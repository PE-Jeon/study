import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/*
Command to update the generated files
Use below commands in a directory which have pubspec.yamlfile
1. Build only one time
>flutter pub run build_runner build

2. Build when changes made
>flutter pub run build_runner watch


*/


@JsonSerializable()
class User {
  int id;
  String email;
  String firstName;

  @JsonKey(includeIfNull: false)
  String middleName;
  String lastName;
  String status;
  String position;
  String uid;
  String company;
  String division;
  String department;
  String team;

  @JsonKey(name: 'create-date', nullable: false)
  DateTime createDate;

  @JsonKey(name: 'last-modified-date')
  DateTime lastModifiedDate;

  User(this.id, this.middleName, {this.email, this.status, this.uid,
      this.firstName, this.lastName,
      this.company, this.division, this.department, this.team, this.position});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  Map toMap(User user) {
    var mapData = Map<String, dynamic> ();
    mapData['email'] = user.email;
    mapData['status'] = user.status;
    mapData['uid'] = user.uid;
    mapData['id'] = user.id;
    mapData['firstName'] = user.firstName;
    mapData['middleName'] = user.middleName;
    mapData['lastName'] = user.lastName;
    mapData['company'] = user.company;
    mapData['division'] = user.division;
    mapData['department'] = user.department;
    mapData['team'] = user.team;
    mapData['position'] = user.position;
    return mapData;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.email = mapData['email'];
    this.firstName = mapData['firstName'];
    this.middleName = mapData['middleName'];
    this.lastName = mapData['lastName'];
    this.status = mapData['status'];
    this.position = mapData['position'];
    this.uid = mapData['uid'];
    this.id = mapData['id'];
    this.company =mapData['company'];
    this.division = mapData['division'];
    this.department = mapData['department'];
    this.team =mapData['team'];
  }
}