import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utility/utils.dart';
import '/data/repository/random_number_repository.dart';
import '/logic/prime_number/prime_number_event.dart';
import '/logic/prime_number/prime_number_state.dart';

class PrimeNumberBloc extends Bloc<PrimeNumberEvent, PrimeNumberState> {
  final RandomNumberRepository repository;
  Timer? _apiTimer;
  DateTime? _lastTimePrimeFound;

  PrimeNumberBloc({required this.repository})
    : super(const PrimeNumberInitialState()) {
    _loadLastPrimeTime();

    on<FetchRandomNumber>((event, emit) async {
      emit(const PrimeNumberLoadingState());
      try {
        final result = await repository.getRandomNumber();

        if (result == null) {
          emit(
            PrimeNumberFailedState(
              message: "There is some issues, please try again.",
            ),
          );
        }

        final number = result!.number;

        if (isPrime(number)) {
          final DateTime now = DateTime.now();
          Duration timeSinceLastPrime = Duration.zero;

          if (_lastTimePrimeFound != null) {
            timeSinceLastPrime = now.difference(_lastTimePrimeFound!);
          }

          await repository.saveLastPrimeTime(now);
          _lastTimePrimeFound = now;

          emit(
            PrimeNumberFoundState(
              primeNumber: number,
              timeSinceLastPrime: timeSinceLastPrime,
            ),
          );
        } else {
          emit(PrimeNumberNotFoundState(lastCheckedNumber: number));
        }
      } catch (e) {
        emit(
          PrimeNumberFailedState(
            message: "Failed to fetch or check number: $e",
          ),
        );
      }
    });

    on<PrimeNumberDetected>((event, emit) {
      emit(
        PrimeNumberFoundState(
          primeNumber: event.primeNumber,
          timeSinceLastPrime: event.timeSinceLastPrime,
        ),
      );
    });

    _apiTimer?.cancel();
    _apiTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      add(const FetchRandomNumber());
    });
  }

  Future<void> _loadLastPrimeTime() async {
    _lastTimePrimeFound = await repository.getLastPrimeTime();
  }

  @override
  Future<void> close() {
    _apiTimer?.cancel();

    return super.close();
  }
}
