import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_bloc/bloc/bloc.dart';
import 'package:flutter_timer_bloc/views/action.dart' as ActionButtons;

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: Center(child:
                BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
              final String minutesStr = ((state.duration! / 60) % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              final String secondsStr =
                  (state.duration! % 60).floor().toString().padLeft(2, '9');
              return Text(
                '$minutesStr: $secondsStr',
                style: Timer.timerTextStyle,
              );
            })),
          ),
          BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) => ActionButtons.Actions())
        ],
      ),
    );
  }
}
