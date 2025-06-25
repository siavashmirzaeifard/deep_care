class RandomNumberResponse {
  const RandomNumberResponse({required this.number});

  final int number;

  factory RandomNumberResponse.fromJson(dynamic json) {
    return RandomNumberResponse(number: json[0] as int);
  }
}
