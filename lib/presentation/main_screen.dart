import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utility/utils.dart';
import '/logic/prime_number/prime_number_bloc.dart';
import '/logic/prime_number/prime_number_state.dart';
import '/logic/timer/timer_bloc.dart';
import '/logic/timer/timer_state.dart';
import '/presentation/congrats_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrimeNumberBloc, PrimeNumberState>(
      listener: (context, state) {
        if (state is PrimeNumberFoundState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CongratsScreen(
                primeNumber: state.primeNumber,
                timeSinceLastPrime: state.timeSinceLastPrime,
              ),
            ),
          );
        }

        if (state is PrimeNumberFailedState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              if (state is TimerSuccessState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formattedTime(state.time),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${formattedDate(state.time)} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          " KW ${getIsoWeekNumber(state.time)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
