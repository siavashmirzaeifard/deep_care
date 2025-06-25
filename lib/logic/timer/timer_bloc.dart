import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/logic/timer/timer_event.dart';
import '/logic/timer/timer_state.dart';

// to achieve the goals for using a timer I checked the official doc of BLoC and convert it as requirements:
//  https://bloclibrary.dev/tutorials/flutter-timer/

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  StreamSubscription<DateTime>? _timer;

  TimerBloc() : super(const TimerInitialState()) {
    on<UpdateTimer>((event, emit) {
      emit(TimerSuccessState(time: event.time));
    });

    _timer?.cancel();
    _timer = Stream.periodic(Duration(seconds: 1), (_) => DateTime.now())
        .listen((time) {
          add(UpdateTimer(time: time));
        });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
