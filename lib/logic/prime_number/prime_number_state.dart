import 'package:equatable/equatable.dart';

abstract class PrimeNumberState extends Equatable {
  const PrimeNumberState();

  @override
  List<Object> get props => [];
}

class PrimeNumberInitialState extends PrimeNumberState {
  const PrimeNumberInitialState();

  @override
  List<Object> get props => [];
}

class PrimeNumberLoadingState extends PrimeNumberState {
  const PrimeNumberLoadingState();

  @override
  List<Object> get props => [];
}

class PrimeNumberFoundState extends PrimeNumberState {
  final int primeNumber;
  final Duration timeSinceLastPrime;

  const PrimeNumberFoundState({
    required this.primeNumber,
    required this.timeSinceLastPrime,
  });

  @override
  List<Object> get props => [primeNumber, timeSinceLastPrime];
}

class PrimeNumberNotFoundState extends PrimeNumberState {
  final int lastCheckedNumber;

  const PrimeNumberNotFoundState({required this.lastCheckedNumber});

  @override
  List<Object> get props => [lastCheckedNumber];
}

class PrimeNumberFailedState extends PrimeNumberState {
  final String message;

  const PrimeNumberFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
