import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object?> get props => [];
}

class UpdateTimer extends TimerEvent {
  const UpdateTimer({required this.time});

  final DateTime time;

  @override
  List<Object?> get props => [time];
}
