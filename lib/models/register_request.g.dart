// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      accountName: json['accountName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      location: json['location'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'accountName': instance.accountName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'location': instance.location,
      'avatar': instance.avatar,
    };
