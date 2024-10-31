// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountUpdateRequestImpl _$$AccountUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountUpdateRequestImpl(
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      location: json['location'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$AccountUpdateRequestImplToJson(
        _$AccountUpdateRequestImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'location': instance.location,
      'avatar': instance.avatar,
    };
