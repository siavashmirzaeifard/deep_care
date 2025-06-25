import 'dart:convert';

import '/data/model/random_number_response.dart';
import '/data/provider/local/local_data_source.dart';
import '/data/provider/remote/get_api.dart';

class RandomNumberRepository {
  const RandomNumberRepository({required this.api, required this.local});

  final GetApi api;
  final LocalDataSource local;

  Future<RandomNumberResponse?> getRandomNumber() async {
    final rawData = await api.getRawData(path: "/random");

    if (rawData.statusCode == 200) {
      return RandomNumberResponse.fromJson(jsonDecode(rawData.body));
    } else {
      return null;
    }
  }

  Future<void> saveLastPrimeTime(DateTime time) async {
    await local.saveLastPrimeTime(time);
  }

  Future<DateTime?> getLastPrimeTime() async {
    return await local.getLastPrimeTime();
  }
}
