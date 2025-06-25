import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object?> get props => [];
}

class TimerInitialState extends TimerState {
  const TimerInitialState();

  @override
  List<Object?> get props => [];
}

class TimerSuccessState extends TimerState {
  const TimerSuccessState({required this.time});

  final DateTime time;

  @override
  List<Object?> get props => [time];
}
