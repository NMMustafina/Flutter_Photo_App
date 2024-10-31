// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_pair_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenPairResponseImpl _$$TokenPairResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenPairResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$TokenPairResponseImplToJson(
        _$TokenPairResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
