// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['middleName'] as String,
    email: json['email'] as String,
    status: json['status'] as String,
    uid: json['uid'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    company: json['company'] as String,
    division: json['division'] as String,
    department: json['department'] as String,
    team: json['team'] as String,
    position: json['position'] as String,
  )
    ..createDate = DateTime.parse(json['create-date'] as String)
    ..lastModifiedDate = json['last-modified-date'] == null
        ? null
        : DateTime.parse(json['last-modified-date'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'email': instance.email,
    'firstName': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('middleName', instance.middleName);
  val['lastName'] = instance.lastName;
  val['status'] = instance.status;
  val['position'] = instance.position;
  val['uid'] = instance.uid;
  val['company'] = instance.company;
  val['division'] = instance.division;
  val['department'] = instance.department;
  val['team'] = instance.team;
  val['create-date'] = instance.createDate.toIso8601String();
  val['last-modified-date'] = instance.lastModifiedDate?.toIso8601String();
  return val;
}
