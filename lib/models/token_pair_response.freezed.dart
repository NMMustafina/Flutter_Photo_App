// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_pair_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenPairResponse _$TokenPairResponseFromJson(Map<String, dynamic> json) {
  return _TokenPairResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenPairResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this TokenPairResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenPairResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenPairResponseCopyWith<TokenPairResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenPairResponseCopyWith<$Res> {
  factory $TokenPairResponseCopyWith(
          TokenPairResponse value, $Res Function(TokenPairResponse) then) =
      _$TokenPairResponseCopyWithImpl<$Res, TokenPairResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokenPairResponseCopyWithImpl<$Res, $Val extends TokenPairResponse>
    implements $TokenPairResponseCopyWith<$Res> {
  _$TokenPairResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenPairResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenPairResponseImplCopyWith<$Res>
    implements $TokenPairResponseCopyWith<$Res> {
  factory _$$TokenPairResponseImplCopyWith(_$TokenPairResponseImpl value,
          $Res Function(_$TokenPairResponseImpl) then) =
      __$$TokenPairResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$TokenPairResponseImplCopyWithImpl<$Res>
    extends _$TokenPairResponseCopyWithImpl<$Res, _$TokenPairResponseImpl>
    implements _$$TokenPairResponseImplCopyWith<$Res> {
  __$$TokenPairResponseImplCopyWithImpl(_$TokenPairResponseImpl _value,
      $Res Function(_$TokenPairResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenPairResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$TokenPairResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenPairResponseImpl implements _TokenPairResponse {
  const _$TokenPairResponseImpl(
      {required this.accessToken, required this.refreshToken});

  factory _$TokenPairResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenPairResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'TokenPairResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenPairResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of TokenPairResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenPairResponseImplCopyWith<_$TokenPairResponseImpl> get copyWith =>
      __$$TokenPairResponseImplCopyWithImpl<_$TokenPairResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenPairResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenPairResponse implements TokenPairResponse {
  const factory _TokenPairResponse(
      {required final String accessToken,
      required final String refreshToken}) = _$TokenPairResponseImpl;

  factory _TokenPairResponse.fromJson(Map<String, dynamic> json) =
      _$TokenPairResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of TokenPairResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenPairResponseImplCopyWith<_$TokenPairResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
