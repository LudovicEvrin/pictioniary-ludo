import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Timer extends StatefulWidget {
  Timer({super.key});

  final CountdownController _controller = CountdownController(autoStart: true);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Countdown(
        controller: widget._controller,
        seconds: 320,
        build: (_, double time) => Text(
          time.toString(),
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        interval: const Duration(milliseconds: 100),
        onFinished: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Timer is done!'),
            ),
          );
        },
      ),
    );
  }
}
