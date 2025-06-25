import 'package:flutter/material.dart';

import '/core/utility/utils.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({
    super.key,
    required this.primeNumber,
    required this.timeSinceLastPrime,
  });

  final int primeNumber;
  final Duration timeSinceLastPrime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Congrats!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You obtained a prime number, it was: $primeNumber",
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Time since last prime number ${formatDuration(timeSinceLastPrime)}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
