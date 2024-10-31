import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_request.freezed.dart';
part 'account_update_request.g.dart';


@freezed
class AccountUpdateRequest with _$AccountUpdateRequest {
  const factory AccountUpdateRequest({
    required String password,
    required String firstName,
    String? lastName,
    String? location,
    String? avatar,
  }) = _AccountUpdateRequest;

  factory AccountUpdateRequest.fromJson(Map<String, dynamic> json) => _$AccountUpdateRequestFromJson(json);
}
