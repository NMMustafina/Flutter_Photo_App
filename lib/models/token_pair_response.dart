import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_pair_response.freezed.dart';
part 'token_pair_response.g.dart';

@freezed
class TokenPairResponse with _$TokenPairResponse {
  const factory TokenPairResponse({
    required String accessToken,
    required String refreshToken,
  }) = _TokenPairResponse;

  factory TokenPairResponse.fromJson(Map<String, dynamic> json) => _$TokenPairResponseFromJson(json);
}
