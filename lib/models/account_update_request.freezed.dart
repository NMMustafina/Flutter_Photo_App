// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountUpdateRequest _$AccountUpdateRequestFromJson(Map<String, dynamic> json) {
  return _AccountUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$AccountUpdateRequest {
  String get password => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this AccountUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountUpdateRequestCopyWith<AccountUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUpdateRequestCopyWith<$Res> {
  factory $AccountUpdateRequestCopyWith(AccountUpdateRequest value,
          $Res Function(AccountUpdateRequest) then) =
      _$AccountUpdateRequestCopyWithImpl<$Res, AccountUpdateRequest>;
  @useResult
  $Res call(
      {String password,
      String firstName,
      String? lastName,
      String? location,
      String? avatar});
}

/// @nodoc
class _$AccountUpdateRequestCopyWithImpl<$Res,
        $Val extends AccountUpdateRequest>
    implements $AccountUpdateRequestCopyWith<$Res> {
  _$AccountUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? location = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountUpdateRequestImplCopyWith<$Res>
    implements $AccountUpdateRequestCopyWith<$Res> {
  factory _$$AccountUpdateRequestImplCopyWith(_$AccountUpdateRequestImpl value,
          $Res Function(_$AccountUpdateRequestImpl) then) =
      __$$AccountUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String password,
      String firstName,
      String? lastName,
      String? location,
      String? avatar});
}

/// @nodoc
class __$$AccountUpdateRequestImplCopyWithImpl<$Res>
    extends _$AccountUpdateRequestCopyWithImpl<$Res, _$AccountUpdateRequestImpl>
    implements _$$AccountUpdateRequestImplCopyWith<$Res> {
  __$$AccountUpdateRequestImplCopyWithImpl(_$AccountUpdateRequestImpl _value,
      $Res Function(_$AccountUpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? location = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$AccountUpdateRequestImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountUpdateRequestImpl implements _AccountUpdateRequest {
  const _$AccountUpdateRequestImpl(
      {required this.password,
      required this.firstName,
      this.lastName,
      this.location,
      this.avatar});

  factory _$AccountUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountUpdateRequestImplFromJson(json);

  @override
  final String password;
  @override
  final String firstName;
  @override
  final String? lastName;
  @override
  final String? location;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'AccountUpdateRequest(password: $password, firstName: $firstName, lastName: $lastName, location: $location, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountUpdateRequestImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, password, firstName, lastName, location, avatar);

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountUpdateRequestImplCopyWith<_$AccountUpdateRequestImpl>
      get copyWith =>
          __$$AccountUpdateRequestImplCopyWithImpl<_$AccountUpdateRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _AccountUpdateRequest implements AccountUpdateRequest {
  const factory _AccountUpdateRequest(
      {required final String password,
      required final String firstName,
      final String? lastName,
      final String? location,
      final String? avatar}) = _$AccountUpdateRequestImpl;

  factory _AccountUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$AccountUpdateRequestImpl.fromJson;

  @override
  String get password;
  @override
  String get firstName;
  @override
  String? get lastName;
  @override
  String? get location;
  @override
  String? get avatar;

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountUpdateRequestImplCopyWith<_$AccountUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
