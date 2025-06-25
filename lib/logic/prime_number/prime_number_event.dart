import 'package:equatable/equatable.dart';

abstract class PrimeNumberEvent extends Equatable {
  const PrimeNumberEvent();

  @override
  List<Object> get props => [];
}

class FetchRandomNumber extends PrimeNumberEvent {
  const FetchRandomNumber();

  @override
  List<Object> get props => [];
}

class PrimeNumberDetected extends PrimeNumberEvent {
  const PrimeNumberDetected({
    required this.primeNumber,
    required this.timeSinceLastPrime,
  });

  final int primeNumber;
  final Duration timeSinceLastPrime;

  @override
  List<Object> get props => [primeNumber, timeSinceLastPrime];
}
